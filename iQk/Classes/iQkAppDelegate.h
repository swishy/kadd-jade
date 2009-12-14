//
//  iQkAppDelegate.h
//  iQk
//
//  Created by nineteen on 12/11/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeSelectViewController.h"
#import "PreferenceViewController.h"
#import "ServerBrowseViewController.h"
#import "iQkGooViewController.h"
#import "Game.h"

@class ModeSelectViewController;
@class PreferenceViewController;
@class ServerBrowseViewController;
@class iQkGooViewController;

@interface iQkAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	ModeSelectViewController *modeSelectViewController;
	ServerBrowseViewController *serverBrowseViewController;
	PreferenceViewController *preferenceViewController;
	iQkGooViewController *iqkGooViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ModeSelectViewController *modeSelectViewController;
@property (nonatomic, retain) IBOutlet ServerBrowseViewController *serverBrowseViewController;
@property (nonatomic, retain) IBOutlet PreferenceViewController *preferenceViewController;
@property (nonatomic, retain) IBOutlet iQkGooViewController *iqkGooViewController;

+ (iQkAppDelegate*)getInstance;

- (void) showGameView:(Game*)game;

- (void) showServerBrowseView;

- (void) showPreferenceView;

- (void) unloadPreferenceView;

- (void) fadeView:(UIView *)id;

- (void)setLang;

+ (id)getLang;

@end

