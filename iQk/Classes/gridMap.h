//
//  gridMap.h
//  iQk
//
//  Created by sixteen on 3/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#define grid1Start (0,0)
#define grid1Finish (120,106.66)

@interface gridMap : NSObject {

}

@property(nonatomic,readonly) CGPoint* touchPoint;

+(id)getGridID:(CGPoint)theTouchPoint;

@end
