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

- (void)showModeSelectView;

- (id) getNickName;

- (void) createPreference;

+ (id)getLang;

@end

