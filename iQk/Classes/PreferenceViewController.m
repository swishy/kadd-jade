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

#import "PreferenceViewController.h"
#import "iQkAppDelegate.h"

NSString *kNickKey				= @"nickNameKey";
//NSString *kSoundLibraryKey		= @"soundLibraryKey";
//NSString *kGooColorKey			= @"gooColorKey";

@implementation PreferenceViewController
@synthesize nickImage, bNickName;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *lang = [iQkAppDelegate getLang];
	
	if ([lang isEqualToString: @"zh-Hans" ]) {
		NSLog(@"Into if statement");
		UIImage *nImage = [UIImage imageNamed:@"iQkNickButton.png"];
		[nickImage setImage:nImage];
		[nImage release];
	}
	
	NSString *nickName;
	//NSString *sound;
	//NSString *color;
	
	NSString *testName = [[NSUserDefaults standardUserDefaults] stringForKey:kNickKey];
	
	if (testName == nil){
		NSLog(@"is null");
		NSString *pathStr = [[NSBundle mainBundle] bundlePath];
		NSString *settingsBundlePath = [pathStr stringByAppendingPathComponent:@"Settings.bundle"];
		NSString *finalPath = [settingsBundlePath stringByAppendingPathComponent:@"Root.plist"];
		
		NSDictionary *settingsDict = [NSDictionary dictionaryWithContentsOfFile:finalPath];
		NSArray *prefSpecifierArray = [settingsDict objectForKey:@"PreferenceSpecifiers"];
		
		NSDictionary *prefItem;
		
		for (prefItem in prefSpecifierArray)
		{
			NSString *keyValueStr = [prefItem objectForKey:@"Key"];
			NSString *defaultValue = [prefItem objectForKey:@"DefaultValue"];
		
			if ([keyValueStr isEqualToString:kNickKey]){
				nickName = defaultValue;
			}
			/*
			if ([keyValueStr isEqualToString:kSoundLibraryKey]){
				sound = defaultValue;
			}
			if ([keyValueStr isEqualToString:kGooColorKey]){
				color = defaultValue;
			}
			*/
		}
		NSDictionary *appDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
									 nickName, kNickKey,
									 //sound, kSoundLibraryKey,
									 //color, kGooColorKey, nil];
									 nil];
		[[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	
	bNickName.text = [[NSUserDefaults standardUserDefaults] stringForKey:kNickKey];
	//bSound.text = [[NSUserDefaults standardUserDefaults] stringForKey:kSoundLibraryKey];
	//bColor.text = [[NSUserDefaults standardUserDefaults] stringForKey:kGooColorKey];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
}


//- (void)writeToDefaults:(NSString*)nickName :(NSString*)sound :(NSString*)color{
- (void)writeToDefaults:(NSString*) nickName{
	NSUserDefaults *name = [NSUserDefaults standardUserDefaults];
	[name setObject:nickName forKey:kNickKey];
	
	
	/*
	NSDictionary *appDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
								 nickName, kNickKey,
								 //sound, kSoundLibraryKey,
								 //color, kGooColorKey, nil];
								 nil];
	[[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
	[[NSUserDefaults standardUserDefaults] synchronize];
	 */
	
	
}

- (void)save{
	[self writeToDefaults: bNickName.text];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[bNickName resignFirstResponder];
}

- (void)dealloc {
	[bNickName release];
	[bColor release];
	[bSound release];
    [super dealloc];
}


@end
