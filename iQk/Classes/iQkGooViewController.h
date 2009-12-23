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
	IBOutlet UIImageView* grid1ImageView;
	UIAccelerometer *iQkAccelerometer;
}

@property (nonatomic, retain) Game* game;
@property (nonatomic, retain) UIImageView* grid1ImageView;

// The following property is what is used to recieve values from HW
@property (nonatomic, retain) UIAccelerometer *iQkAccelerometer;

- (IBAction)clicked:(id)sender;

- (IBAction)activate;

- (IBAction)touched:(id)sender;

- (void)doAnimation:(UIView *)gooView;

- (void)endAnimation:(NSTimer*)timer;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;

@end
