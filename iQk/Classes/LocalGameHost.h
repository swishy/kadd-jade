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
