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

@class Game;

@interface iQkGooViewController : UIViewController <GameDelegate, UITextFieldDelegate>{
	Game* game;
	IBOutlet UIButton* goo;
	IBOutlet UILabel* show;
}

@property (nonatomic, retain) Game* game;

- (IBAction)clicked:(id)sender;

- (IBAction)activate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
