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

#import "ServerBrowserDelegate.h"
#import "ServerBrowser.h"

// A category on NSNetService that's used to sort NSNetService objects by their name.
@interface NSNetService (BrowserViewCOntrollerAdditions)
- (NSComparisonResult) localizedCaseInsensitiveCompareByName:(NSNetService*)aService;
@end

@implementation NSNetService (BrowserViewControllerAdditions)
- (NSComparisonResult) localizedCaseInsensitiveCompareByName:(NSNetService*)aService {
	return [[self name] localizedCaseInsensitiveCompare:[aService name]];
}
@end


// Private properties and methods
@interface ServerBrowser ()

// Sort services alphabetically
- (void)sortServers;
@end

@implementation ServerBrowser

@synthesize servers;
@synthesize delegate;

// Initialize
- (id)init {
	servers = [[NSMutableArray alloc] init];
	return self;
}

// Cleanup
- (void)dealloc {
	if ( servers !=nil ) {
		[servers release];
		servers = nil;
	}
	self.delegate = nil;
	[super dealloc];
}


// Start bowsing for servers
- (BOOL)start {
	// Restarting?
	if ( netServiceBrowser != nil ) {
		[self stop];
	}
	
	netServiceBrowser = [[NSNetServiceBrowser alloc] init];
	if( !netServiceBrowser ) {
		return NO;
	}
	
	netServiceBrowser.delegate = self;
	[netServiceBrowser searchForServicesOfType:@"_iQk2._tcp." inDomain:@""];
	
	return YES;
}

// Terminate current service browser and clean up
- (void)stop {
	if ( netServiceBrowser == nil ) {
		return;
	}
	
	[netServiceBrowser stop];
	[netServiceBrowser release];
	netServiceBrowser = nil;
	
	[servers removeAllObjects];
	
}

- (void)sortServers {
	[servers sortUsingSelector:@selector(localizedCaseInsensitiveCompareByName:)];
}

#pragma mark -
#pragma mark NSNetServiceBrowser Delegate Method Implementations

// New service was found
- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing {
	// Make sure that we don't have such service already (why would this happen? not sure)
	if ( ! [servers containsObject:netService] ) {
		// Add it to our list
		[servers addObject:netService];
	}

	// If more entries are coming, no need to update UI just yet
	if ( moreServicesComing ) {
		return;
	}
	
	// Sort alphabetically and let our delegate know
	[self sortServers];
	[delegate updateServerList];
}

// Service was removed
- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing {
	// Remove from list
	[servers removeObject:netService];
	
	// If more entries are coming, no need to update UI just yet
	if ( moreServicesComing ) {
		return;
	}
	
	// Sort alphabetically and let our delegate know
	[self sortServers];
	[delegate updateServerList];
}

@end
