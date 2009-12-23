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


@interface PreferenceViewController : UIViewController {
	IBOutlet UITextField *bNickName;
	IBOutlet UITextField *bColor;
	IBOutlet UITextField *bSound;
	IBOutlet UIImage *nickImage;
}

@property (nonatomic, retain) UIImage *nickImage;
@property (nonatomic, retain) UITextField *bNickName;

//- (void)writeToDefaults:(NSString*) nickName :(NSString*) sound: (NSString*) color;
- (void)writeToDefaults:(NSString*) nickName;
- (void)save;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
