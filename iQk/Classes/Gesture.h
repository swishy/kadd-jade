//
//  Gesture.h
//  iQk
//
//  Created by Anakin Hao on 9/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Gesture : NSObject {
	NSString* name;
}

@property(nonatomic,retain) NSString* name;

- (id)init;

- (void) encodeWithCoder:(NSCoder*) encoder;

- (id) initWithCoder:(NSCoder*) decoder;

@end
