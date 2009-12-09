//
//  LocalServerHost.m
//  iQk
//
//  Created by Anakin Hao on 9/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LocalGameHost.h"
#import "Connection.h"
#import "Audio.h"

// Private properties
@interface LocalGameHost ()
@property (nonatomic,retain) Server* server;
@property (nonatomic,retain) NSMutableSet* clients;
@end

@implementation LocalGameHost

@synthesize server, clients;

// Initialization
- (id)init {
	clients = [[NSMutableSet alloc] init];
	
	return self;
}

// Cleanup
- (void)dealloc {
	self.clients = nil;
	self.server = nil;
	[super dealloc];
}


// Start the server and announce self
- (BOOL)start {
	// Create new instance of the server and start it up
	server = [[Server alloc] init];
	
	// We will be processing server events
	server.delegate = self;
	
	// Try to start it up
	if ( ! [server start] ) {
		self.server = nil;
		return NO;
	}
	
	return YES;
}


// Stop everything
- (void)stop {
	// Destroy server
	[server stop];
	self.server = nil;
	
	// Close all connections
	[clients makeObjectsPerformSelector:@selector(close)];
}


// Send chat message to all connected clients
- (void)broadcastGesture:(Gesture*)gesture fromUser:(NSString*)name {
	// Display message locally
	NSLog(@"Into broadcastGesture");
	//NSLog(@"My Delegate is" delegate);
	[delegate reactByGesture:gesture fromUser:name];
	
	// Create network packet to be sent to all clients
	NSDictionary* packet = [NSDictionary dictionaryWithObjectsAndKeys:gesture, @"gesture", name, @"from", nil];
	
	// Send it out
	[clients makeObjectsPerformSelector:@selector(sendNetworkPacket:) withObject:packet];
}


#pragma mark -
#pragma mark ServerDelegate Method Implementations

// Server has failed. Stop the world.
- (void) serverFailed:(Server*)server reason:(NSString*)reason {
	// Stop everything and let our delegate know
	[self stop];
	[delegate serverHostTerminated:self reason:reason];
}


// New client connected to our server. Add it.
- (void) handleNewConnection:(Connection*)connection {
	// Delegate everything to us
	connection.delegate = self;
	
	// Add to our list of clients
	[clients addObject:connection];
}


#pragma mark -
#pragma mark ConnectionDelegate Method Implementations

// We won't be initiating connections, so this is not important
- (void) connectionAttemptFailed:(Connection*)connection {
}


// One of the clients disconnected, remove it from our list
- (void) connectionTerminated:(Connection*)connection {
	[clients removeObject:connection];
}


// One of connected clients sent a chat message. Propagate it further.
- (void) receivedNetworkPacket:(NSDictionary*)packet viaConnection:(Connection*)connection {
	// Display message locally
	[delegate reactByGesture:[packet objectForKey:@"gesture"] fromUser:[packet objectForKey:@"from"]];
	
	// Broadcast this message to all connected clients, including the one that sent it
	[clients makeObjectsPerformSelector:@selector(sendNetworkPacket:) withObject:packet];
}

/*
- (void)reactByGesture:(Gesture*)gesture fromUser:(NSString*)userName{
	NSLog(@"LocalGameHost.displayChatMessage reached.");
	NSLog(gesture.name);
	
	[Audio playSound:gesture.name];
}
 */

@end
