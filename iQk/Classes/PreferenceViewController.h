//
//  PreferenceView.h
//  iQk
//
//  Created by seventeen on 14/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
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

- (void)writeToDefaults:(NSString*) nickName :(NSString*) sound: (NSString*) color;
- (void)save;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
