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

#import "GameDelegate.h"
#import	"Gesture.h"
#import "Game.h"


@implementation Game

@synthesize delegate;

// Cleanup
- (void)dealloc {
	self.delegate = nil;
	[super dealloc];
}


// "Abstract" methods
- (BOOL)start {
	// Crude way to emulate "abstract" class
	[self doesNotRecognizeSelector:_cmd];
	return NO;
}

- (void)stop {
	// Crude way to emulate "abstract" class
	[self doesNotRecognizeSelector:_cmd];
}

- (void)broadcastGesture:(Gesture*)gesture fromUser:(NSString*)name {
	// Crude way to emulate "abstract" class
	[self doesNotRecognizeSelector:_cmd];
}
@end
