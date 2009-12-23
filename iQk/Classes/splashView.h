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
#import <QuartzCore/QuartzCore.h>

@protocol splashViewDelegate <NSObject>
@optional
- (void)splashIsDone;
@end

typedef enum {
	SplashViewAnimationNone,
	SplashViewAnimationSlideLeft,
	SplashViewAnimationFade,
} SplashViewAnimation;

@interface splashView : UIView {
	
	id<splashViewDelegate> delegate;
	UIImageView *splashImage;
	
	UIImage *image;
	NSTimeInterval delay;
	BOOL touchAllowed;
	SplashViewAnimation animation;
	NSTimeInterval animationDelay;
	
	BOOL isFinishing;
	
}
@property (retain) id<splashViewDelegate> delegate;
@property (retain) UIImage *image;
@property NSTimeInterval delay;
@property BOOL touchAllowed;
@property SplashViewAnimation animation;
@property NSTimeInterval animationDelay;
@property BOOL isFinishing;

- (id)initWithImage:(UIImage *)screenImage;
- (void)startSplash;
- (void)dismissSplash;
- (void)dismissSplashFinish;

@end
