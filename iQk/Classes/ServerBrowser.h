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

@class ServerBrowserDelegate;

@interface ServerBrowser : NSObject {
	NSNetServiceBrowser* netServiceBrowser;
	NSMutableArray* servers;
	id<ServerBrowserDelegate> delegate;
}

@property(nonatomic,readonly) NSArray* servers;
@property(nonatomic,retain) id<ServerBrowserDelegate> delegate;

// Start browsing for Bonjour services
- (BOOL)start;

// Stop everything
- (void)stop;

@end
