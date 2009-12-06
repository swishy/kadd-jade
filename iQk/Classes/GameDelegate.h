//
//  ServerHostDelegate.h
//  iQk
//
//  Created by Anakin Hao on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
@class Game;
@class Gesture;
@protocol GameDelegate

- (void) reactByGesture:(Gesture*)gesture fromUser:(NSString*)userName;
- (void) serverHostTerminated:(id)game reason:(NSString*)string;
@end
