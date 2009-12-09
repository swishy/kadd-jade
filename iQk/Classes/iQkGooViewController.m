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


@implementation iQkGooViewController

@synthesize game;

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
    self.game = nil;
    [super dealloc];
}

// OK from here we have all foo dealing with events 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint touchCoordinates = [touch locationInView:self.view];
	NSLog(@"in touchesBegan event");
	NSString *grid = [gridMap getGridID:touchCoordinates];
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
