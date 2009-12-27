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

#import "gridMap.h"


@implementation gridMap


+ (id)getGridID:(CGPoint)theTouchPoint :(NSString*)tilt{
	
	float coordx = [[NSNumber numberWithInt:theTouchPoint.x] floatValue];
	float coordy = [[NSNumber numberWithInt:theTouchPoint.y] floatValue];
	float columnValue = coordx / 106.66;
	float rowValue = coordy / 120;
	
	NSString *columnID;
	NSString *rowID;
	
	if ( columnValue > 0 && columnValue <= 1 ) {
		columnID = @"0";
	} else if ( columnValue > 1 && columnValue <= 2 ) {
			columnID = @"1";
	} else if ( columnValue > 2 && columnValue <= 3 ) {
			columnID = @"2";
	}
	
	if ( rowValue >= 0 && rowValue <= 1 ) {
		rowID = @"0";
	} else if ( rowValue > 1 && rowValue <= 2 ) {
		rowID = @"1";
	} else if ( rowValue > 2 && rowValue <= 3 ) {
		rowID = @"2";
	} else if ( rowValue > 3 && rowValue <= 4 ) {
		rowID = @"3";
	} 
	
	NSString *grid = @"grid";
	grid = [ grid stringByAppendingString:columnID];
	grid = [ grid stringByAppendingString:rowID];
	grid = [ grid stringByAppendingString:tilt];

	[columnID release];
	[rowID release];
	
	return grid;
	
}

- (void)dealloc{
	[super dealloc];
}

@end
