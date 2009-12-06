//
//  RemoteServerHost.h
//  iQk
//
//  Created by Anakin Hao on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "Connection.h"
#import "Gesture.h"

@interface RemoteGameHost : Game <ConnectionDelegate> {
	// Our connection to the chat server
	Connection* connection;
}

// Initialize with host address and port
- (id)initWithHost:(NSString*)host andPort:(int)port;

// Initialize with a reference to a net service discovered via Bonjour
- (id)initWithNetService:(NSNetService*)netService;
@end
