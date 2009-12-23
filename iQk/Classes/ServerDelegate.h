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

@class Server, Connection;

@protocol ServerDelegate

// Server has been terminated because of an error
- (void) serverFailed:(Server*)server reason:(NSString*)reason;

// Server has accepted a new connection and it needs to be processed
- (void) handleNewConnection:(Connection*)connection;

@end
