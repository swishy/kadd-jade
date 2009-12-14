//
//  iQkAppDelegate.m
//  iQk
//
//  Created by nineteen on 12/11/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iQkAppDelegate.h"
#import "splashView.h"

@implementation iQkAppDelegate

@synthesize window;
@synthesize modeSelectViewController;
@synthesize serverBrowseViewController;
@synthesize preferenceViewController;
@synthesize iqkGooViewController;

static iQkAppDelegate* _instance;
static iQkAppDelegate* _lang;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	_instance = self;
	[self setLang];

	splashView *splash = [[splashView alloc] initWithImage:
						  [UIImage imageNamed:@"iQkSplash.png"]];
	[splash startSplash];
	
	modeSelectViewController = [ModeSelectViewController alloc];
	serverBrowseViewController = [ServerBrowseViewController alloc];
	iqkGooViewController = [iQkGooViewController alloc];
	[window addSubview:iqkGooViewController.view];
	//[window addSubview:serverBrowseViewController.view];
	[window addSubview:modeSelectViewController.view];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
	
	[window bringSubviewToFront:modeSelectViewController.view];
	//[modeSelectViewController activate];
}


- (void)dealloc {
	[modeSelectViewController release];
	[serverBrowseViewController release];
	[preferenceViewController release];
	[iqkGooViewController release];
	[window release];
    [super dealloc];
}

- (void)setLang {
	
	NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
	NSArray* languages = [defs objectForKey:@"AppleLanguages"];
	NSString* preferredLang = [languages objectAtIndex:0];
	NSLog(@"%@\n", languages);
	_lang = preferredLang;
}

- (void)fadeView:(UIView*)id{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.40];
	
		// as we start the fade effect, start the timeout timer for automatically hiding HoverView
		id.alpha = 0.0;
	[UIView commitAnimations];	
}


- (void)showServerBrowseView{
	//NSLog(@"showServerBrowseView reached.");
	[window sendSubviewToBack:modeSelectViewController.view];
	[window addSubview:serverBrowseViewController.view];
	[serverBrowseViewController activate];
	[window bringSubviewToFront:serverBrowseViewController.view];
}

- (void)showPreferenceView{
	preferenceViewController = [PreferenceViewController alloc];
	[window addSubview:preferenceViewController.view];
}

- (void)unloadPreferenceView{
	[preferenceViewController save];
	[window sendSubviewToBack:preferenceViewController.view];
}

+ (id)getLang{
	
	return _lang;
	
}

- (void)showGameView:(Game*)game {
	// this method may be changed due to future Goo view design.
	/*
	NSLog(@"showGameView reached.");
	iQkGooViewController.gameServer = server;
	[iQkGooViewController activate];
	*/
	//iqkGooViewController = [iQkGooViewController alloc];
	//[window addSubview:iqkGooViewController.view];
	
	iqkGooViewController.game = game;
	[iqkGooViewController activate];
	
	[window bringSubviewToFront:iqkGooViewController.view];
	
	NSLog(@"showGameView finished.");
}

+ (id)getInstance {
	return _instance;
}
@end
