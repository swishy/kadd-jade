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
#import <CFNetwork/CFSocketStream.h>
#import "ConnectionDelegate.h"




@interface Connection : NSObject {
	id<ConnectionDelegate> delegate;
	
	// Connection info: host address and port
	NSString* host;
	int port;
	
	// Connection info: native socket handle
	CFSocketNativeHandle connectedSocketHandle;
	
	// Connection info: NSNetService
	NSNetService* netService;
	
	// Read stream
	CFReadStreamRef readStream;
	bool readStreamOpen;
	NSMutableData* incomingDataBuffer;
	int packetBodySize;
	
	// Write stream
	CFWriteStreamRef writeStream;
	bool writeStreamOpen;
	NSMutableData* outgoingDataBuffer;
}

@property(nonatomic,retain) id<ConnectionDelegate> delegate;

// Initialize and store connection information until 'connect' is called
- (id)initWithHostAddress:(NSString*)host andPort:(int)port;

// Initialize using a native socket handle, assuming connection is open
- (id)initWithNativeSocketHandle:(CFSocketNativeHandle)nativeSocketHandle;

// Initialize using an instance of NSNetService
- (id)initWithNetService:(NSNetService*)netService;

// Connect using whatever connection info that was passed during initialization
- (BOOL)connect;

// Close connection
- (void)close;

// Send network message
- (void)sendNetworkPacket:(NSDictionary*)packet;

@end

