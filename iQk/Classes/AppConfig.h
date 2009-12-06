//
//  AppConfig.h
//  iQk
//
//  Created by Anakin Hao on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppConfig : NSObject {
	NSString* name;
}

@property (retain) NSString* name;

// Singleton - one instance for the whole app
+ (AppConfig*)getInstance;

@end
