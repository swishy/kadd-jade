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

#import "iQkGooViewController.h"
#import "AppConfig.h"
#import "Gesture.h"
#import "Audio.h"
#import "iQkAppDelegate.h"



@implementation iQkGooViewController

@synthesize game;
@synthesize iQkAccelerometer;
@synthesize grid1ImageView;
@synthesize tilt;

//static NSString *tilt;
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
	
	//[self becomeFirstResponder];
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
	[grid1ImageView release];
	[tilt release];
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
	
	// here is an example wiggle
	CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"opacity"];
	animate.duration = 0.1;
	animate.repeatCount = 1e100f;
	animate.autoreverses = YES;
	animate.fromValue = [NSNumber numberWithFloat:1.0];
	animate.toValue=[NSNumber numberWithFloat:0.8];
	//animate.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(animateLayer.transform,0.1, 0.0 ,1.0 ,2.0)];
	
	// doing the wiggle
	[gooView.layer addAnimation:animate forKey:@"animateOpacity"];
	
	// setting a timer to remove the layer
	//NSTimer *animateTimer = [NSTimer scheduledTimerWithTimeInterval:(0.1) target:self selector:@selector(endAnimation:) userInfo:gooView.layer repeats:NO];
	[NSTimer scheduledTimerWithTimeInterval:(0.1) target:self selector:@selector(endAnimation:) userInfo:gooView.layer repeats:NO];
	
}

-(void)endAnimation:(NSTimer*)timer {
	// stopping the fade now
	[((CALayer*)timer.userInfo) removeAllAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	//CGPoint touchCoordinates = [touch locationInView:self.view];
	CGPoint touchCoordinates = [touch locationInView:self.view];
	NSString *grid = [gridMap getGridID:touchCoordinates :tilt];
	Gesture *gesture = [[[Gesture alloc] init:grid] autorelease];
	[game broadcastGesture:gesture fromUser:[AppConfig getInstance].name];
	[self doAnimation:[self view]];
	//[gesture dealloc];
	//[touch release];
	//gesture = nil;
	//touch = nil;
} 
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//UIView *current = [NSArray [self.subviews(1)]];
	//[self doAnimation:[NSArray * self.subviews[1]]];

} 

- (void)touched:(id)sender {
	NSLog(@"triggered new touched event");
}

- (void)clicked:(id)sender {
	[game broadcastGesture:[[Gesture alloc] init] fromUser:[AppConfig getInstance].name];
	//[Audio playSound:gesture.name];
}

- (void)reactByGesture:(Gesture*)gesture fromUser:(NSString*)userName{
	[Audio playSound:gesture.grid];
}

@end
