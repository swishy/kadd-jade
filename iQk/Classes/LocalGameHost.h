//
//  LocalServerHost.h
//  iQk
//
//  Created by Anakin Hao on 9/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "Server.h"
#import "ServerDelegate.h"
#import "ConnectionDelegate.h"

@interface LocalGameHost : Game <GameDelegate, ConnectionDelegate> {
	// We accept connections from other clients using an instance of the Server class
	Server* server;
	
	// Container for all connected clients
	NSMutableSet* clients;
}

// Initialize everything
- (id)init;

//- (void) reactByGesture:(Gesture*)gesture fromUser:(NSString*)userName;
@end
