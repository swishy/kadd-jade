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
	
	// set tilt now , this stops the simulator bailing out due to lack of accel 
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
	}
	if (acceleration.y >= 0.8) {
		// Tilt forward
	}
	if (acceleration.x <= -0.8) {
		// Tilt left
		tilt = @"l";
	}
	if (acceleration.y <= -0.8) {
		// Tilt backward
	}
}

-(void)doAnimation:(UIView *)gooView {
	
	// grabbing the layer of the tocuhed view.
	CALayer *animateLayer = [gooView layer];
	
	// here is an example wiggle
	CABasicAnimation *wiggle = [CABasicAnimation animationWithKeyPath:@"transform"];
	wiggle.duration = 0.1;
	wiggle.repeatCount = 1e100f;
	wiggle.autoreverses = YES;
	wiggle.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(animateLayer.transform,0.1, 0.0 ,1.0 ,2.0)];
	
	// doing the wiggle
	[animateLayer addAnimation:wiggle forKey:@"wiggle"];
	
	// setting a timer to remove the layer
	NSTimer *wiggleTimer = [NSTimer scheduledTimerWithTimeInterval:(2) target:self selector:@selector(endAnimation:) userInfo:animateLayer repeats:NO];
	
}

-(void)endAnimation:(NSTimer*)timer {
	// stopping the wiggle now
	[((CALayer*)timer.userInfo) removeAllAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint touchCoordinates = [touch locationInView:self.view];
	NSString *grid = [gridMap getGridID:touchCoordinates :tilt];
	[game broadcastGesture:[[Gesture alloc] init:grid] fromUser:[AppConfig getInstance].name];
} 
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[self doAnimation:[self view]];

} 

- (void)clicked:(id)sender {
	[game broadcastGesture:[[Gesture alloc] init] fromUser:[AppConfig getInstance].name];
	//[Audio playSound:gesture.name];
}

- (void)reactByGesture:(Gesture*)gesture fromUser:(NSString*)userName{
	[Audio playSound:gesture.grid];
}

@end
