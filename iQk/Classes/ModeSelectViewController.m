//
//  ModeSelectViewController.m
//  test
//
//  Created by seventeen on 12/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ModeSelectViewController.h"
#import "iQkAppDelegate.h"
@implementation ModeSelectViewController

@synthesize modeSelectView, soloButton, multiButton;
- (void)viewDidLoad{
	
	NSString *lang = [iQkAppDelegate getLang];
	
	NSLog(@" in show mode select ");
	NSLog(lang);
	if ([lang isEqualToString: @"en" ]) {
		NSLog(@"Into if statement");
		UIImage *soloImg = [UIImage imageNamed:@"iQkSoloButtonEn.png"];
		[soloButton setImage:soloImg forState:UIControlStateNormal];
		[soloImg release];
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
	//[[iQkAppDelegate getInstance] fadeView:self.view];
	[self showModeSelectView:NO];
	[[iQkAppDelegate getInstance] showServerBrowseView];

	
}

- (void)multiButton:(id)sender{
	[self showModeSelectView:NO];
	[[iQkAppDelegate getInstance] showServerBrowseView];
}

@end
