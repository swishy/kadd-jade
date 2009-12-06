//
//  ServerHost.h
//  iQk
//
//  Created by Anakin Hao on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDelegate.h"
#import "Gesture.h"

@interface Game : NSObject {
	id<GameDelegate> delegate;
}

@property(nonatomic,retain) id<GameDelegate> delegate;

- (BOOL)start;
- (void)stop;
- (void)broadcastGesture:(Gesture*)gesture fromUser:(NSString*)name;

@end
