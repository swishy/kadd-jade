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
@class Game;
@class Gesture;
@protocol GameDelegate

- (void) reactByGesture:(Gesture*)gesture fromUser:(NSString*)userName;
- (void) iQkTerminated:(id)game reason:(NSString*)string;
@end
