//
//  ConnectionDelegate.h
//  iQk
//
//  Created by Anakin Hao on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>

@class Connection;

@protocol ConnectionDelegate

- (void) connectionAttemptFailed:(Connection*)connection;
- (void) connectionTerminated:(Connection*)connection;
- (void) receivedNetworkPacket:(NSDictionary*)message viaConnection:(Connection*)connection;

@end


@end
