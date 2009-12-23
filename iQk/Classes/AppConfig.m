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

#import "AppConfig.h"
#import "iQkAppDelegate.h"

static AppConfig* instance;

@implementation AppConfig

@synthesize name;

// Initialization
- (id) init {
	//self.name = @"unknown";
	self.name = [[iQkAppDelegate getInstance] getNickName];
	return self;
}


// Cleanup
- (void)dealloc {
	self.name = nil;
	[super dealloc];
}


// Automatically initialize if called for the first time
+ (AppConfig*) getInstance {
	@synchronized([AppConfig class]) {
		if ( instance == nil ) {
			instance = [[AppConfig alloc] init];
		}
	}
	
	return instance;
}

@end
