//
//  MSTFirstMenuViewController.m
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTFirstMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+Genie.h"
#import "MSTMyAccViewController.h"
#import "MSTFirstMenuCreditCardViewController.h"
#import "MSTFirstMenuMailViewController.h"
#import "MSTFirstMenuMapViewController.h"
#import "MSTFirstMenuSettingsViewController.h"
#import "MSTCustomButton.h"
#import "MSTBarCodeView.h"
#import "MSTCredicardView.h"
#import "MSTmailView.h"
#import "MSTMapView.h"
#import "MSTSettingsView.h"



@interface MSTFirstMenuViewController () {
    MSTBarCodeView *barcodeView;
    MSTCredicardView *creditCardView;
    MSTmailView *mailView;
    MSTMapView *mapView;
    MSTSettingsView *settingsView;

}

@end

@implementation MSTFirstMenuViewController
@synthesize menuView,button,titleLbl,backButton;
@synthesize myAccButton;
@synthesize myProButton;
@synthesize transButton;
@synthesize stmtButton;
@synthesize swipeUpView;
@synthesize settingsButton;
@synthesize bgView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self beautifyComponents];
    [self rearrangeUIElements];
    
}

- (IBAction)onClickBackbutton:(id)sender {
        [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickMenuButton:(id)sender {
    
    if (ismenuOpen) {
        CGRect endRect = self.button.frame;
        [menuView genieInTransitionWithDuration:0.25
                            destinationRect:endRect
                            destinationEdge:BCRectEdgeTop
                                 completion:^{
                                     NSLog(@"I'm done!");
                                      [menuView setHidden:YES];
                                     ismenuOpen = NO;
                                     [button setBackgroundImage:[UIImage imageNamed:@"pullup_ipad.png"] forState:UIControlStateNormal];
//                                     [button setImageEdgeInsets:UIEdgeInsetsMake(0.0f,0.0f,0.0f,0.0f)];

                                     
                                 }];
        
    }else{
        [menuView setHidden:NO];
        CGRect startRect = self.button.frame;
        [menuView genieOutTransitionWithDuration:0.25
                                       startRect:startRect
                                       startEdge:BCRectEdgeTop
                                      completion:^{
                                          ismenuOpen = YES;
                                          [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
                                          [button setBackgroundImage:[UIImage imageNamed:@"pulldown_iPad.png"] forState:UIControlStateNormal];
//                                          [button setImageEdgeInsets:UIEdgeInsetsMake(0.0f,0.0f,18.0f,0.0f)];
                                      }];
    }
}


- (IBAction)onClickMenuFeatures:(id)sender {

    switch ([sender tag]) {
        case 1: {
            
            if(!barcodeView){
                barcodeView = [[MSTBarCodeView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:barcodeView];
            }
            [self animateViewLefttoRight:barcodeView];
            break;
        }
        case 2: {
            if(!creditCardView){
                creditCardView = [[MSTCredicardView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:creditCardView];
            }
            [self animateViewRighttoLeft:creditCardView];
            break;
        }
        case 3: {
            if(!mailView){
                mailView = [[MSTmailView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:mailView];
            }
            [self animateViewLefttoRight:mailView];
            break;
        }
        case 4: {
            if(!mapView){
                mapView = [[MSTMapView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:mapView];
            }
            [self animateViewRighttoLeft:mapView];
            break;
        }
        case 5: {
            
            if(!settingsView){
                settingsView = [[MSTSettingsView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:settingsView];
            }
            [self animateViewBottomToTop:settingsView];
            break;
        }
        default:
            break;
    }
    
}



- (void)addSubviewsFromSuperclass
{
    UIView *selfView = self.view;
    UIView *nibView = nil;
    @try
    {
        nibView = [NSBundle.mainBundle loadNibNamed:NSStringFromClass([self superclass]) owner:self options:nil][0];
    }
    @catch (NSException *exception)
    {
        NSLog(@"Something exceptional happened while loading nib:\n%@", exception);
    }
    self.view = selfView;
    for (UIView *view in nibView.subviews)
        [self.view addSubview:view];
}

//- (void)loadDefaultView:(NSString *)title {
//
//    backButton = [[UIButton alloc] initWithFrame:CGRectMake(20,20,57,30)];
//    [backButton setTitle:@"< Back" forState:UIControlStateNormal];
//    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [[backButton titleLabel] setFont:[UIFont systemFontOfSize:15.0f]];
//    [backButton addTarget:self action:@selector(onClickBackbutton:) forControlEvents:UIControlEventTouchUpInside];
//    [backButton setTitleColor:[UIColor colorWithRed:0.000000 green:0.478431 blue:1.000000 alpha:1.000000] forState:UIControlStateNormal];
//
//    [self.view addSubview:backButton];
//    
//    titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(93,24,129,30)];
//    [titleLbl setText:title];
//    [self.view addSubview:titleLbl];
//
//    
//    button = [[UIButton alloc] initWithFrame:CGRectMake(129, 535, 56, 30)];
//    [button setTitle:@"Menu" forState:UIControlStateNormal];
//    [[button titleLabel] setFont:[UIFont systemFontOfSize:15.0f]];
//    [button setTitleColor:[UIColor colorWithRed:0.000000 green:0.478431 blue:1.000000 alpha:1.000000] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(onClickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
// 
//
//    menuView = [[FXBlurView alloc] initWithFrame:CGRectMake( 57,380,200,150)];
//    [menuView.layer setCornerRadius:8.0f];
//    
//
////    bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
////    [bgView setImage:[UIImage imageNamed:@"dashboardbg.png"]];
////    [menuView addSubview:bgView];
//    
//    
//    [menuView setHidden:YES];
//    
//    myAccButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(0,0,100,50)];
//    [myAccButton setTag:1];
//    [myAccButton.titleLabel setTextColor:[UIColor whiteColor]];
//    [myAccButton setImage:[UIImage imageNamed:@"barcode.png"] forState:UIControlStateNormal];
//    [myAccButton setTitle:@"Barcode Scan" forState:UIControlStateNormal];
//    [[myAccButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];
//
//    [myAccButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
//    [menuView addSubview:myAccButton];
//
//    myProButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(100,0,100,50)];
//    [myProButton.titleLabel setTextColor:[UIColor whiteColor]];
//    [myProButton setTag:2];
//    [myProButton setImage:[UIImage imageNamed:@"credit_card.png"] forState:UIControlStateNormal];
//    [myProButton setTitle:@"Credit Card" forState:UIControlStateNormal];
//    [[myProButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];
//
//    [myProButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
//    [menuView addSubview:myProButton];
//
//    transButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(0,50,100,50)];
//    [transButton.titleLabel setTextColor:[UIColor whiteColor]];
//    [transButton setTag:3];
//    [transButton setImage:[UIImage imageNamed:@"mail.png"] forState:UIControlStateNormal];
//    [transButton setTitle:@"Mail" forState:UIControlStateNormal];
//    [[transButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];
//
//    [transButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
//    [menuView addSubview:transButton];
//
//    stmtButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(100,50,100,50)];
//    [stmtButton.titleLabel setTextColor:[UIColor whiteColor]];
//    [stmtButton setTag:4];
//    [stmtButton setImage:[UIImage imageNamed:@"map_pin.png"] forState:UIControlStateNormal];
//    [stmtButton setTitle:@"Navigation" forState:UIControlStateNormal];
//    [[stmtButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];
//
//    [stmtButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
//    [menuView addSubview:stmtButton];
//    
//    
//    settingsButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(0,100,200,50)];
//    [settingsButton.titleLabel setTextColor:[UIColor whiteColor]];//[UIColor colorWithRed:0.000000 green:0.478431 blue:1.000000 alpha:1.000000]];
//    [settingsButton setTag:5];
//    [settingsButton setImage:[UIImage imageNamed:@"process.png"] forState:UIControlStateNormal];
//    [settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
//    [[settingsButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];
//    [settingsButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
//    [menuView addSubview:settingsButton];
//    
//    [self.view addSubview:menuView];
//    [menuView setHidden:YES];
//    
//    [self beautifyComponents];
//}



- (void)beautifyComponents {
    
    [menuView setBackgroundColor:[UIColor lightGrayColor]];
    [menuView setHidden:YES];
    [menuView.layer setCornerRadius:8.0f];
    ismenuOpen = NO;
    
    [bgView.layer setCornerRadius:8.0f];
    
    [myAccButton.layer setBorderWidth:.5f];
    [myAccButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    
    
    [myProButton.layer setBorderWidth:.5f];
    [myProButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    
    
    [transButton.layer setBorderWidth:.5f];
    [transButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    
    
    [stmtButton.layer setBorderWidth:.5f];
    [stmtButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    
    [settingsButton.layer setBorderWidth:.5f];
    [settingsButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    

}



- (void)animateViewRighttoLeft:(UIView *)viewRef{
    
    [viewRef setFrame:CGRectMake(320, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
    
    [UIView animateWithDuration:0.3 animations:^{
        [viewRef setFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
        
    }];
    [self.view bringSubviewToFront:viewRef];
    [self.view bringSubviewToFront:menuView];
}

- (void)animateViewLefttoRight:(UIView *)viewRef{
    
    [viewRef setFrame:CGRectMake(-320, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
    
    [UIView animateWithDuration:0.3 animations:^{
        [viewRef setFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
        
    }];
    [self.view bringSubviewToFront:viewRef];
    [self.view bringSubviewToFront:menuView];
}


- (void)animateViewBottomToTop:(UIView *)viewRef{
    
    [viewRef setFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, self.view.frame.size.height-100)];
    
    [UIView animateWithDuration:0.3 animations:^{
        [viewRef setFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
        
    }];
    [self.view bringSubviewToFront:viewRef];
    [self.view bringSubviewToFront:menuView];
}


- (void)rearrangeUIElements {
    
    if ([[UIScreen mainScreen] bounds].size.height == 480) {
     
        menuView.frame = CGRectMake(57,310,200,150);
        button.frame = CGRectMake(129, 460, 56, 22);
        
    }
}


@end
