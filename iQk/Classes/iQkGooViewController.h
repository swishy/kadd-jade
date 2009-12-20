//
//  iQkGooViewController.h
//  iQk
//
//  Created by nineteen on 12/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "GameDelegate.h"
#import "gridMap.h";
#import <QuartzCore/QuartzCore.h>

@class Game;

@interface iQkGooViewController : UIViewController <GameDelegate, UITextFieldDelegate, UIAccelerometerDelegate> {
	Game* game;
	IBOutlet UIButton* goo;
	IBOutlet UILabel* show;
	UIAccelerometer *iQkAccelerometer;
}

@property (nonatomic, retain) Game* game;

// The following property is what is used to recieve values from HW
@property (nonatomic, retain) UIAccelerometer *iQkAccelerometer;

- (IBAction)clicked:(id)sender;

- (IBAction)activate;

- (void)doAnimation:(UIView *)gooView;

- (void)endAnimation:(NSTimer*)timer;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;

@end
