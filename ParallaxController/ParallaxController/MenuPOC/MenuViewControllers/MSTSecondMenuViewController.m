//
//  ViewController.m
//  MenuSample
//
//  Created by Bala Baskaran on 13/01/14.
//  Copyright (c) 2014 mobinvo. All rights reserved.
//

#import "MSTSecondMenuViewController.h"
#import "MSTBarCodeView.h"
#import "FXBlurView.h"
#import "MSTCredicardView.h"
#import "MSTmailView.h"
#import "MSTMapView.h"
#import "MSTSettingsView.h"

#define LabelTag 101
//#define MenuTable_Width 320
#define MenuTable_Height 220
#define Menu_Offset 30

@interface  MSTSecondMenuViewController () {
        MSTBarCodeView *barcodeView;
        MSTCredicardView *creditCardView;
        MSTmailView *mailView;
        MSTMapView *mapView;
        MSTSettingsView *settingsView;
        // NSMutableArray *logoArray;
        // FXBlurView *menuView;
        UIImageView *bgView;
        FXBlurView *overlayView;
}

@end

@implementation MSTSecondMenuViewController
@synthesize tapAction = _tapAction;
@synthesize menuTableView = _menuTableView;
@synthesize lblTitle = _lblTitle;
@synthesize menuArray = _menuArray;
@synthesize tapGuesture = _tapGuesture;
@synthesize isMenuOpen = _isMenuOpen;
@synthesize overlayTapGuesture = _overlayTapGuesture;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect frame = [UIScreen mainScreen].applicationFrame;

    // overlay view
    overlayView = [[FXBlurView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.size.height - MenuTable_Height, frame.size.width, frame.size.height - 10)];
//    [overlayView setBackgroundColor:[UIColor lightGrayColor]];
    [overlayView setBlurEnabled:YES];
    [overlayView setBlurRadius:10];
    [overlayView setDynamic:YES];
    //[overlayView setAlpha:0.4];
    [self.view addSubview:overlayView];
    
    
    // set tableview delegate and datasource
    [self.menuTableView setDelegate:self];
    [self.menuTableView setDataSource:self];
    [self.menuTableView setFrame:CGRectMake(0, frame.origin.y + frame.size.height, frame.size.width,MenuTable_Height)];
    [self.menuTableView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.menuTableView];
    

    
   
    // initial time setup
    [self setIsMenuOpen:NO];
    [overlayView setHidden:YES];
    // subviews frames
    CGRect lblFrame = self.lblTitle.frame;
    CGFloat y = (frame.origin.y + frame.size.height) - lblFrame.size.height;
    lblFrame.origin.y = y;
    [self.lblTitle setFrame:lblFrame];
    // rounded corner label
    [self.lblTitle.layer setCornerRadius:5.0];
    [self.view addSubview:self.lblTitle];
    
    // set tap guesture to UILabel
    self.tapGuesture.numberOfTapsRequired = 1;
    [self.lblTitle addGestureRecognizer:self.tapGuesture];
    self.lblTitle.userInteractionEnabled = YES;
    [self.lblTitle setTag:LabelTag];
    
    // menu list array
    self.menuArray = [[NSMutableArray alloc] initWithObjects:
                      [NSString stringWithFormat:@"Code Scan"],
                      [NSString stringWithFormat:@"CreditCard"],
                      [NSString stringWithFormat:@"Email"],
                      [NSString stringWithFormat:@"Locations"],
                      [NSString stringWithFormat:@"Settings"],
                      nil];
//    logoArray = [[NSMutableArray alloc] initWithObjects:@"barcode_big",
//                 @"credit_card_big",
//                 @"mail_big",
//                 @"map_pin_big",
//                 @"process_big", nil];
    
}


- (IBAction)tapAction:(id)sender {
    // open menu list with animation
    [self.lblTitle setHidden:YES];
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         if (self.isMenuOpen) {
                             self.menuTableView.frame = CGRectMake(0, frame.origin.y + frame.size.height, frame.size.width, MenuTable_Height);
                             [overlayView setFrame:self.menuTableView.frame];
                             
                         } else {
                             self.menuTableView.frame = CGRectMake(0, (frame.origin.y + frame.size.height) -  self.menuTableView.frame.size.height , frame.size.width, MenuTable_Height);
                             
                             [overlayView setFrame:self.menuTableView.frame];
                             // Hide overlayview
                             [overlayView setHidden:NO];
                         }
                     }
                     completion:^(BOOL finished){
                         if (self.isMenuOpen) {
                             [self.lblTitle setHidden:NO];
                             [self setIsMenuOpen:NO];
                             // Hide overlayview
                             [overlayView setHidden:YES];
                         }
                     }];
}



- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"The %@ button was tapped.", [actionSheet buttonTitleAtIndex:buttonIndex]);
    if ([self.menuArray count] == buttonIndex) {
        NSLog(@"Cancel was tapped");
    } else {
        [self.lblTitle setText:[self.menuArray objectAtIndex:buttonIndex]];
    }
}
/*
 //setup ActionSheet item
 - (void)createActionSheetMenu {
 self.menuActionSheet = [[UIActionSheet alloc] initWithTitle:@"Menu" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
 // ObjC Fast Enumeration
 for (NSString *title in self.menuArray) {
 [self.menuActionSheet addButtonWithTitle:title];
 }
 [self.menuActionSheet addButtonWithTitle:@"Cancel"];
 self.menuActionSheet.cancelButtonIndex = [self.menuArray count];
 
 }*/

- (void)viewDidUnload {
    [self setLblTitle:nil];
    [self setTapGuesture:nil];
    [self setTapAction:nil];
    [self setMenuTableView:nil];
    [self setOverlayTapGuesture:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return [self.menuArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
    }
    // Set the data for this cell:
    [tableView setSeparatorColor:[UIColor whiteColor]];
    
    [cell setBackgroundColor:[UIColor clearColor]];
//    bgView = [[UIImageView alloc] initWithFrame:cell.frame];
//    [menuView setFrame:cell.frame];
//    [bgView setImage:[UIImage imageNamed:@"dashboardbg.png"]];
//    [menuView addSubview:bgView];
//    [cell setBackgroundView:menuView];
    
    cell.textLabel.text = [self.menuArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma UITableView Delegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // set the titile label text
    [self.lblTitle setText:[self.menuArray objectAtIndex:indexPath.row]];
    [tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    NSString *selectedMenu = [self.menuArray objectAtIndex:indexPath.row];
    UIView *aTargetView = nil;
    if ([selectedMenu isEqualToString:@"Code Scan"]) {
        if(!barcodeView){
            barcodeView = [[MSTBarCodeView alloc] initWithFrame:CGRectMake(-500, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
            [self.view addSubview:barcodeView];
           
        }
         aTargetView = barcodeView;
    }
    if ([selectedMenu isEqualToString:@"CreditCard"]) {
        if(!creditCardView){
            creditCardView = [[MSTCredicardView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
            [self.view addSubview:creditCardView];
            
        }
        aTargetView = creditCardView;
       
      
    }  if ([selectedMenu isEqualToString:@"Email"]) {
        if(!mailView){
            mailView = [[MSTmailView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
            [self.view addSubview:mailView];
        }
         aTargetView = mailView;
    }  if ([selectedMenu isEqualToString:@"Locations"]) {
        if(!mapView){
            mapView = [[MSTMapView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
            [self.view addSubview:mapView];
        }
         aTargetView = mapView;
    }
    else if ([selectedMenu isEqualToString:@"Settings"]){
    
        if(!settingsView){
            settingsView = [[MSTSettingsView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
            [self.view addSubview:settingsView];
        }
        aTargetView = settingsView;
   
 /*   NSString *file = [[NSBundle mainBundle] pathForResource:[logoArray objectAtIndex:indexPath.row] ofType:@"png"];
    
    UIImage *currentImage = [UIImage imageWithContentsOfFile:file];
    [barcodeView UpdateWithImage:currentImage colorCode:[self getRandomColor] titleText:[self.menuArray objectAtIndex:indexPath.row]];*/
    
    }
    [self.view bringSubviewToFront:aTargetView];
    [self.view bringSubviewToFront:overlayView];
    [self.view bringSubviewToFront:self.menuTableView];
     // call content view with animation
    [self animateMethod:indexPath targetView:aTargetView];
    // call Re-Order action
    [self startReorderAction:indexPath];

    
    
}

-(void)animateMethod:(NSIndexPath *)index targetView:(UIView *)view
{
    float x = 0;
    float y = 50;
    if (index.row == 0) {
        x = -500;
    } else if (index.row == 1) {
        x = 500;
    } else if (index.row == 2) {
        y = - 500;
    } else if (index.row == 3) {
        y = 500;
    } else {
        x = 200;
        y = 300;
    }
    [view setFrame:CGRectMake(x, y, self.view.frame.size.width, self.view.frame.size.height-100)];
    [UIView animateWithDuration:0.5
                               delay:0.0
                             options:index.row
                          animations:^{
                              //moving the cloud across the screen here
                              
                              [view setFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                          }
                          completion:^(BOOL finished) {
                              if (finished) {
                                  NSLog(@"Done!");
                                  //[self animateMethod];
                              }
                          }];
}



- (void)startReorderAction:(NSIndexPath *)indexPath {
    // swap datasource values
    self.isMenuOpen = YES;
    [self performSelector:@selector(tapAction:) withObject:nil afterDelay:0.6];
    // Re-Order datasource values
    id menuObject = [self.menuArray objectAtIndex:indexPath.row];
    [self.menuArray removeObjectAtIndex:indexPath.row];
    [self.menuArray insertObject:menuObject atIndex:0];
    
    // re-order logo datasource
//    id logoObject = [logoArray objectAtIndex:indexPath.row];
//    [logoArray removeObjectAtIndex:indexPath.row];
//    [logoArray insertObject:logoObject atIndex:0];
}

- (IBAction)menuDismissAction:(id)sender {
    [self setIsMenuOpen:YES];
    [self tapAction:sender];
    [overlayView setHidden:YES];
}



- (IBAction)onClickBackbutton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (UIColor *) getRandomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


- (void)loadEmail {
    // Email Subject
    NSString *emailTitle = @"Menu Test";
    // Email Content
    NSString *messageBody = @"Animated SecondMenu Testing";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"abc@jpmchase.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
