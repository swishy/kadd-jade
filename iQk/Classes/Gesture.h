//
//  Gesture.h
//  iQk
//
//  Created by Anakin Hao on 9/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Gesture : NSObject <NSCoding>{
	NSString* grid;
}

@property(nonatomic,retain) NSString* grid;

- (id)init;

@end
