//
//  gridMap.m
//  iQk
//
//  Created by sixteen on 3/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "gridMap.h"


@implementation gridMap


+ (id)getGridID:(CGPoint)theTouchPoint {
	
	NSDictionary *grid;
	NSString *coordx = [[NSNumber numberWithInt:theTouchPoint.x] stringValue];
	NSString *coordy = [[NSNumber numberWithInt:theTouchPoint.y] stringValue];
	NSLog(@"Inside getGridID method");
	NSLog(coordx);
	NSLog(coordy);
	return grid;
	
}


@end
