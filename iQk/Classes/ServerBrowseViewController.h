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
#import "ServerBrowserDelegate.h"
#import "ServerBrowser.h"


@interface ServerBrowseViewController : UIViewController <UITableViewDataSource, ServerBrowserDelegate>{
	ServerBrowser* serverBrowser;
	IBOutlet UITableView* serverList;
	IBOutlet UIButton *serverButton;
	IBOutlet UIButton *joinButton;
}

@property (nonatomic, retain) UIButton *serverButton;
@property (nonatomic, retain) UIButton *joinButton;

- (IBAction)createNewServerHost:(id)sender;
- (IBAction)joinRemoteServerHost:(id)sender;


- (void)activate;
/*
- (IBAction)joinButton:(id)sender;
- (IBAction)createButton:(id)sender;
 */
@end
