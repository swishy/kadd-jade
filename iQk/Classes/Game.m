//
//  ServerHost.m
//  iQk
//
//  Created by Anakin Hao on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
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
