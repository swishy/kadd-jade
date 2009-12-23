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

#import <Foundation/Foundation.h>


#define grid1Start (0,0)
#define grid1Finish (120,106.66)

@interface gridMap : NSObject {

}

@property(nonatomic,readonly) CGPoint* touchPoint;

+(id)getGridID:(CGPoint)theTouchPoint :tilt;

@end
