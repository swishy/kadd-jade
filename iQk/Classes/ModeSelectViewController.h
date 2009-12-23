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

