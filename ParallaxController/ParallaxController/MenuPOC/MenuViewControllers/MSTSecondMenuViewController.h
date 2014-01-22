//
//  MSTSecondMenuViewController.h
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MSTSecondMenuViewController : UIViewController <UIActionSheetDelegate, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) NSMutableArray *menuArray;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGuesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapAction;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (assign) BOOL isMenuOpen;
@property (weak, nonatomic) IBOutlet UIView *bgOverlayView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *overlayTapGuesture;



- (IBAction)tapAction:(id)sender;
- (void)startReorderAction:(NSIndexPath *)indexPath;
- (IBAction)menuDismissAction:(id)sender;
- (IBAction)onClickBackbutton:(id)sender;

@end
