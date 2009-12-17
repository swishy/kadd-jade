//
//  ServeBrowseViewController.h
//  iQk
//
//  Created by seventeen on 16/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
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
