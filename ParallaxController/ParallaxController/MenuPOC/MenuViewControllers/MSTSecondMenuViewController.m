//
//  ViewController.m
//  MenuSample
//
//  Created by Bala Baskaran on 13/01/14.
//  Copyright (c) 2014 mobinvo. All rights reserved.
//

#import "MSTSecondMenuViewController.h"

#define LabelTag 101
//#define MenuTable_Width 320
#define MenuTable_Height 220
#define Menu_Offset 30


@implementation MSTSecondMenuViewController
@synthesize tapAction = _tapAction;
@synthesize menuTableView = _menuTableView;
@synthesize lblTitle = _lblTitle;
@synthesize menuArray = _menuArray;
@synthesize tapGuesture = _tapGuesture;
@synthesize isMenuOpen = _isMenuOpen;
@synthesize bgOverlayView = _bgOverlayView;
@synthesize overlayTapGuesture = _overlayTapGuesture;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set tableview delegate and datasource
    [self.menuTableView setDelegate:self];
    [self.menuTableView setDataSource:self];
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    [self.menuTableView setFrame:CGRectMake(0, frame.origin.y + frame.size.height, frame.size.width,MenuTable_Height)];
    
    // initial time setup
    [self setIsMenuOpen:NO];
    [self.bgOverlayView setHidden:YES];
    // subviews frames
    CGRect lblFrame = self.lblTitle.frame;
    CGFloat y = (frame.origin.y + frame.size.height) - lblFrame.size.height;
    lblFrame.origin.y = y;
    [self.lblTitle setFrame:lblFrame];
    // rounded corner label
    [self.lblTitle.layer setCornerRadius:5.0];
    
    
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
                             // Hide overlayview
                             [self.bgOverlayView setHidden:YES];
                             
                         } else {
                             self.menuTableView.frame = CGRectMake(0, (frame.origin.y + frame.size.height) - (frame.origin.y + self.menuTableView.frame.size.height) , frame.size.width, MenuTable_Height);
                             // Hide overlayview
                             [self.bgOverlayView setHidden:NO];
                         }
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         if (self.isMenuOpen) {
                             [self.lblTitle setHidden:NO];
                             [self setIsMenuOpen:NO];
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
    [self setBgOverlayView:nil];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Set the data for this cell:
    cell.textLabel.text = [self.menuArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma UITableView Delegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // set the titile label text
    [self.lblTitle setText:[self.menuArray objectAtIndex:indexPath.row]];
    [tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    // call Re-Order action
    [self startReorderAction:indexPath];
    
    
}

- (void)startReorderAction:(NSIndexPath *)indexPath {
    // swap datasource values
    self.isMenuOpen = YES;
    [self performSelector:@selector(tapAction:) withObject:nil afterDelay:0.6];
    // Re-Order datasource values
    id object = [self.menuArray objectAtIndex:indexPath.row];
    [self.menuArray removeObjectAtIndex:indexPath.row];
    [self.menuArray insertObject:object atIndex:0];
}

- (IBAction)menuDismissAction:(id)sender {
    [self setIsMenuOpen:YES];
    [self tapAction:sender];
    [self.bgOverlayView setHidden:YES];
}



- (IBAction)onClickBackbutton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



@end
