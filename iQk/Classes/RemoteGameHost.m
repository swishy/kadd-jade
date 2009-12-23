//
// Copyright 2009 All rights reserved.
// Anakin Hao akua28@hotmail.com 
// Keryn Thompson keryn_bubbles@hotmail.com 
// Diana Sawirs dsawirs@jadeworld.com 
// Dale Anderson dale@st8vrt.com
// 
// Under gpl2 licence 
// http://www.gnu.org/licenses/gpl-2.0.txt
//

#import	"Gesture.h"
#import "RemoteGameHost.h"
#import "Audio.h"


@interface RemoteGameHost ()
@property (nonatomic,retain) Connection* connection;
@end


@implementation RemoteGameHost

@synthesize connection;

// Setup connection but don't connect yet
- (id)initWithHost:(NSString*)host andPort:(int)port {
	connection = [[Connection alloc] initWithHostAddress:host andPort:port];
	return self;
}


// Initialize and connect to a net service
- (id)initWithNetService:(NSNetService*)netService {
	connection = [[Connection alloc] initWithNetService:netService];
	return self;
}


// Cleanup
- (void)dealloc {
	self.connection = nil;
	[super dealloc];
}


// Start everything up, connect to server
- (BOOL)start {
	if ( connection == nil ) {
		return NO;
	}
	
	// We are the delegate
	connection.delegate = self;
	
	return [connection connect];
}


// Stop everything, disconnect from server
- (void)stop {
	if ( connection == nil ) {
		return;
	}
	
	[connection close];
	self.connection = nil;
}


// Send chat message to the server
- (void)broadcastGesture:(Gesture*)gesture fromUser:(NSString*)name {
	// Create network packet to be sent to all clients
	NSDictionary* packet = [NSDictionary dictionaryWithObjectsAndKeys:gesture, @"gesture", name, @"from", nil];
	
	// Send it out
	[connection sendNetworkPacket:packet];
}


#pragma mark -
#pragma mark ConnectionDelegate Method Implementations

- (void)connectionAttemptFailed:(Connection*)connection {
	[delegate roomTerminated:self reason:@"Wasn't able to connect to server"];
}


- (void)connectionTerminated:(Connection*)connection {
	[delegate roomTerminated:self reason:@"Connection to server closed"];
}


- (void)receivedNetworkPacket:(NSDictionary*)packet viaConnection:(Connection*)connection {
	// Display message locally
	//[delegate displayChatMessage:[packet objectForKey:@"message"] fromUser:[packet objectForKey:@"from"]];
	[delegate reactByGesture:[packet objectForKey:@"gesture"] fromUser:[packet objectForKey:@"from"]];
	NSLog(@"REmoteGameHost.receivedNetworkPacket reached.");
}


@end
