//
//  iQkGooViewController.m
//  iQk
//
//  Created by nineteen on 12/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "iQkGooViewController.h"
#import "AppConfig.h"
#import "Gesture.h"
#import "Audio.h"
#import "iQkAppDelegate.h"


@implementation iQkGooViewController

@synthesize game;
@synthesize iQkAccelerometer;

static NSString *tilt;
static BOOL preferenceLoaded = NO;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.iQkAccelerometer = [UIAccelerometer sharedAccelerometer];
	self.iQkAccelerometer.updateInterval = .1;
	self.iQkAccelerometer.delegate = self;
	tilt = @"d";
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)activate {
	if ( self.game != nil){
		game.delegate = self;
		[self.game start];
	}
	
	[self becomeFirstResponder];
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


- (void)dealloc {
    [game release];
	[goo release];
	[show release];
	[iQkAccelerometer release];
    [super dealloc];
}

// OK from here we have all foo dealing with events 

- (void)accelerometer:(UIAccelerometer *)iQkAccelerometer didAccelerate:(UIAcceleration *)acceleration {
	
	// set tilt now overide in method
	tilt = @"d";
	
	//check for shake first
	const float violence = 2.3;   // earth gravitation value sensibility
	BOOL shake = NO;
	// X, Y und Z
	if (acceleration.x > violence || acceleration.x < (-1* violence))
		shake = YES;
	if (acceleration.y > violence || acceleration.y < (-1* violence))
		shake = YES;
	if (acceleration.z > violence || acceleration.z < (-3* violence))
		shake = YES;
	
	if (shake)
	{
		if (preferenceLoaded == NO){
			preferenceLoaded = YES;
			[[iQkAppDelegate getInstance] showPreferenceView];
		}
		else if (preferenceLoaded == YES) {
			[[iQkAppDelegate getInstance] unloadPreferenceView];
			preferenceLoaded = NO;
		}
		[Audio playSound:@"shake"];
	}
	if (acceleration.x >= 0.8) {
		// Tilt right
		tilt = @"r";
		NSLog(@"activating new grid");
	}
	if (acceleration.y >= 0.8) {
		// Tilt forward
		NSLog(@"activating new grid again");
	}
	if (acceleration.x <= -0.8) {
		// Tilt left
		tilt = @"l";
		NSLog(@"activating new grid 2");
	}
	if (acceleration.y <= -0.8) {
		// Tilt backward
		NSLog(@"activating new grid 3 again");
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint touchCoordinates = [touch locationInView:self.view];
	NSLog(@"in touchesBegan event");
	NSString *grid = [gridMap getGridID:touchCoordinates :tilt];
	[game broadcastGesture:[[Gesture alloc] init:grid] fromUser:[AppConfig getInstance].name];
} 
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"in touchesMoved event");

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"in touchesEnded event");
} 

- (void)clicked:(id)sender {
	[game broadcastGesture:[[Gesture alloc] init] fromUser:[AppConfig getInstance].name];
	//[Audio playSound:gesture.name];
}

- (void)reactByGesture:(Gesture*)gesture fromUser:(NSString*)userName{
	NSLog(@"displayChatMessage reached.");
	NSLog(gesture.grid);
	[Audio playSound:gesture.grid];
}

@end
