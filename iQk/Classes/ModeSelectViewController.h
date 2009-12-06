//
//  ModeSelectViewController.h
//  test
//
//  Created by seventeen on 12/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeSelectView.h"
@class ModeSelectView;

extern NSString	*Show_ModeSelectView;


@interface ModeSelectViewController : UIViewController {
	IBOutlet ModeSelectView *modeSelectView;
	IBOutlet UIButton *soloButton;
	IBOutlet UIButton *multiButton;
}

@property (nonatomic, retain) ModeSelectView *modeSelectView;
@property (nonatomic, retain) UIButton *soloButton;
@property (nonatomic, retain) UIButton *multiButton;

- (IBAction)soloButton:(id)sender;
- (IBAction)multiButton:(id)sender;

@end

