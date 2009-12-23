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

#import "ModeSelectViewController.h"
#import "iQkAppDelegate.h"
#import	"LocalGameHost.h"
@implementation ModeSelectViewController

@synthesize modeSelectView, soloButton, multiButton;
- (void)viewDidLoad{
	
	NSString *lang = [iQkAppDelegate getLang];

	if ([lang isEqualToString: @"zh-Hans" ]) {
		NSLog(@"Into if statement");
		UIImage *soloImg = [UIImage imageNamed:@"iQkSoloButton.png"];
		UIImage *multiImg = [UIImage imageNamed:@"iQkMultiButton.png"];
		[soloButton setImage:soloImg forState:UIControlStateNormal];
		[multiButton setImage:multiImg forState:UIControlStateNormal];
		[soloImg release];
		[multiImg release];
	}
	/*
	CGRect frame = modeSelectView.frame;
	frame.origin.x = round((self.view.frame.size.width - frame.size.width) / 2.0);
	frame.origin.y = self.view.frame.size.height - 100;
	modeSelectView.frame = frame;
	*/
	// this two line should be commented out, since most actions are implemented in iQkAppdelegate.
	//[self.view addSubview:modeSelectView];
}

- (void)showModeSelectView:(BOOL)show{
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.40];
	
	if (show)
	{
		// as we start the fade effect, start the timeout timer for automatically hiding HoverView
		self.view.alpha = 1.0;
	}
	else
	{
		self.view.alpha = 0.0;
	}
	
	[UIView commitAnimations];
}


- (void)dealloc{
	[soloButton release];
	[multiButton release];
	[modeSelectView release];
	[super dealloc];
}

- (void)didReceiveMemoryWarning
{
	// invoke super's implementation to do the Right Thing, but also release the input controller since we can do that	
	// In practice this is unlikely to be used in this application, and it would be of little benefit,
	// but the principle is the important thing
	//
	[super didReceiveMemoryWarning];
}

- (void)awakeFromNib
{
	NSString *lang = [iQkAppDelegate getLang];
	NSLog(@" in awak from Nib");
	if (lang == @"en") {
		[soloButton setBackgroundImage: [UIImage imageNamed:@"iQkSoloButtonEn.png"] forState: UIControlStateNormal];
	}
}

- (void)soloButton:(id)sender{
	//[self showModeSelectView:NO];
	//[[iQkAppDelegate getInstance] showServerBrowseView];
	
	LocalGameHost* server = [[[LocalGameHost alloc] init] autorelease];
	[[iQkAppDelegate getInstance] showGameView:server];

	
}

- (void)multiButton:(id)sender{
	[self showModeSelectView:NO];
	[[iQkAppDelegate getInstance] showServerBrowseView];
}

@end
