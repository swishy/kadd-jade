//
//  Gesture.m
//  iQk
//
//  Created by Anakin Hao on 9/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Gesture.h"


@implementation Gesture
@synthesize grid;

- (void)dealloc{
	self.grid = nil;
	[super dealloc];
}


- (id)init:(NSString *) theGrid{
	[super init];
	self.grid = theGrid;
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
	[encoder encodeObject:self.grid forKey:@"gesture.name"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	NSLog(@"initWithCoder reached.");
	self = [super init];
	self.grid = [[decoder decodeObjectForKey:@"gesture.name"] retain];
	return self;
}
@end
