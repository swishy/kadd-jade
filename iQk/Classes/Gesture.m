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
