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

#import "ServerBrowseViewController.h"
#import "iQkAppDelegate.h"
#import "LocalGameHost.h"
#import "RemoteGameHost.h"

@interface ServerBrowseViewController()
@property(nonatomic,retain) ServerBrowser* serverBrowser;
@end

@implementation ServerBrowseViewController
@synthesize serverBrowser, serverButton, joinButton;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad {
	serverBrowser = [[ServerBrowser alloc] init];
	serverBrowser.delegate = self;
	NSString *lang = [iQkAppDelegate getLang];
	if ([lang isEqualToString: @"zh-Hans" ]) {
		NSLog(@"Into if statement");
		UIImage *serverImg = [UIImage imageNamed:@"iQkCreateServer.png"];
		UIImage *joinImg = [UIImage imageNamed:@"iQkJoinButton.png"];
		[serverButton setImage:serverImg forState:UIControlStateNormal];
		[joinButton setImage:joinImg forState:UIControlStateNormal];
		[serverImg release];
		[joinImg release];
	}
}

- (void)dealloc {
	[serverBrowser release];
	[serverList release];
	[super dealloc];
}

- (void)activate{
	[serverBrowser start];
}

- (void)createNewServerHost:(id)sender {
	[serverBrowser stop];
	
	LocalGameHost* server = [[[LocalGameHost alloc] init] autorelease];
	[[iQkAppDelegate getInstance] showGameView:server];
}
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction)joinRemoteServerHost:(id)sender {
	// Figure out which server is selected
	NSIndexPath* currentRow = [serverList indexPathForSelectedRow];
	if ( currentRow == nil ) {
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Which server room?" message:@"Please select which server room you want to join from the list above" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert release];
		return;
	}
	
	NSNetService* selectedServer = [serverBrowser.servers objectAtIndex:currentRow.row];
	
	// Create chat room that will connect to that chat server
	RemoteGameHost* remoteGameHost = [[[RemoteGameHost alloc] initWithNetService:selectedServer] autorelease];
	
	// Stop browsing and switch over to chat room
	[serverBrowser stop];
	[[iQkAppDelegate getInstance] showGameView:remoteGameHost];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)updateServerList {
	[serverList reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [serverBrowser.servers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString* serverListIdentifier = @"serverListIdentifier";
	
	UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:serverListIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:serverListIdentifier] autorelease];
	}
	
	// Set cell's text to server's name
	NSNetService* server = [serverBrowser.servers objectAtIndex:indexPath.row];
	cell.text = [server name];
	
	return cell;
}



@end
