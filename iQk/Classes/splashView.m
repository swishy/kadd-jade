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

#import "splashView.h"
#import "iQkAppDelegate.h"

@implementation splashView
@synthesize delegate;
@synthesize image;
@synthesize delay;
@synthesize touchAllowed;
@synthesize animation;
@synthesize isFinishing;
@synthesize animationDelay;

- (id)initWithImage:(UIImage *)screenImage {
	
	if (self = [super initWithFrame:[[UIScreen mainScreen] applicationFrame]]) {
		self.image = screenImage;
		//CGAffineTransform rotate = CGAffineTransformMakeRotation(1.57079633);
		//[self setTransform:rotate];
		self.delay = 5;
		self.touchAllowed = NO;
		self.animation = SplashViewAnimationFade;
		self.animationDelay = .5;
		self.isFinishing = NO;
	}
	return self;
}

- (void)startSplash {
	
	[[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:self];
	splashImage = [[UIImageView alloc] initWithImage:self.image];
	[self addSubview:splashImage];
	[self performSelector:@selector(dismissSplash) withObject:self afterDelay:self.delay];
}

- (void)dismissSplash {
	
	if (self.isFinishing || self.animation == SplashViewAnimationNone) {
		[self dismissSplashFinish];
	} else if (self.animation == SplashViewAnimationSlideLeft) {
		CABasicAnimation *animSplash = [CABasicAnimation animationWithKeyPath:@"transform"];
		animSplash.duration = self.animationDelay;
		animSplash.removedOnCompletion = NO;
		animSplash.fillMode = kCAFillModeForwards;
		animSplash.toValue = [NSValue valueWithCATransform3D:
							  CATransform3DMakeAffineTransform
							  (CGAffineTransformMakeTranslation(-320, 0))];
		animSplash.delegate = self;
		[self.layer addAnimation:animSplash forKey:@"animateTransform"];
	} else if (self.animation == SplashViewAnimationFade) {
		CABasicAnimation *animSplash = [CABasicAnimation animationWithKeyPath:@"opacity"];
		animSplash.duration = self.animationDelay;
		animSplash.removedOnCompletion = NO;
		animSplash.fillMode = kCAFillModeForwards;
		animSplash.toValue = [NSNumber numberWithFloat:0];
		animSplash.delegate = self;
		[self.layer addAnimation:animSplash forKey:@"animateOpacity"];
	}
	self.isFinishing = YES;
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
	
	[self dismissSplashFinish];
}

- (void)dismissSplashFinish {
	
	if (splashImage) {
		[splashImage removeFromSuperview];
		[self removeFromSuperview];
		[image release];
	}               
	if (self.delegate != NULL && [self.delegate respondsToSelector:@selector(splashIsDone)]) {
		[delegate splashIsDone];
	}
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if (self.touchAllowed) {
		[self dismissSplash];
	}
}

- (void)dealloc {
	[splashImage release];
	[image release];
	//[animation release];
    [super dealloc];
}


@end
