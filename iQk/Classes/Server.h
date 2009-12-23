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
#import "ServerDelegate.h"


@interface Server : NSObject {
    uint16_t port;
    CFSocketRef listeningSocket;
    id<ServerDelegate> delegate;
    NSNetService* netService;
}

// Initialize and start listening for connections
- (BOOL)start;
- (void)stop;

// Delegate receives various notifications about the state of our server
@property(nonatomic,retain) id<ServerDelegate> delegate;

@end
