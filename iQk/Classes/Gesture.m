//
//  Gesture.m
//  iQk
//
//  Created by Anakin Hao on 9/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Gesture.h"


@implementation Gesture
@synthesize name;

- (void)dealloc{
	self.name = nil;
	[super dealloc];
}


- (id)init {
	self.name = @"hahahahaha";
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
	[encoder encodeObject:self forKey:@"theGesture"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	NSLog(@"initWithCoder reached.");
	self = [[decoder decodeObjectForKey:@"theGesture"] retain];
	return self;
}
@end
