//
//  gridMap.m
//  iQk
//
//  Created by sixteen on 3/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "gridMap.h"
#import "Audio.h"


@implementation gridMap


+ (id)getGridID:(CGPoint)theTouchPoint {
	
	NSDictionary *grid;
	NSString *coordx = [[NSNumber numberWithInt:theTouchPoint.x] stringValue];
	NSString *coordy = [[NSNumber numberWithInt:theTouchPoint.y] stringValue];
	NSLog(@"Inside getGridID method");
	NSLog(coordx);
	NSLog(coordy);
	NSString *sample = @"grid1";
	//[Audio playSound:sample];
	return @"grid1";
	
}


@end
