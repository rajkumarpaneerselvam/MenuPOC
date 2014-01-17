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


@interface MSTFirstMenuViewController ()

@end

@implementation MSTFirstMenuViewController
@synthesize menuView,button,titleLbl,backButton;
@synthesize myAccButton;
@synthesize myProButton;
@synthesize transButton;
@synthesize stmtButton;
@synthesize dragMenuView;
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

    
//    MSTCustomButton *custBut = [[MSTCustomButton alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
//    [custBut setImage:[UIImage imageNamed:@"barcode.png"] forState:UIControlStateNormal];
//    [custBut setTitle:@"Test" forState:UIControlStateNormal];
//    [custBut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [self.view addSubview:custBut];
    
    
    [self beautifyComponents];
    
}
- (IBAction)onClickBackbutton:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
        
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
                                 }];
        
    }else{
        [menuView setHidden:NO];
        CGRect startRect = self.button.frame;
        [menuView genieOutTransitionWithDuration:0.25
                                       startRect:startRect
                                       startEdge:BCRectEdgeTop
                                      completion:^{
                                          ismenuOpen = YES;
                                      }];
    }
}


- (IBAction)onClickMenuFeatures:(id)sender {

    [self onClickMenuButton:nil];
    switch ([sender tag]) {
        case 1: {
            MSTMyAccViewController *viewCtrl = (MSTMyAccViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MSTMyAccViewController"];
            [self presentViewController:viewCtrl  animated:YES completion:nil];
            break;
        }
        case 2: {

            MSTFirstMenuCreditCardViewController *viewCtrl = (MSTFirstMenuCreditCardViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MSTFirstMenuCreditCardViewController"];
            [self presentViewController:viewCtrl  animated:YES completion:nil];
            break;
        }
        case 3: {
            MSTFirstMenuMailViewController *viewCtrl = (MSTFirstMenuMailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MSTFirstMenuMailViewController"];
            [self presentViewController:viewCtrl  animated:YES completion:nil];
            break;
        }
        case 4: {
            MSTFirstMenuMapViewController *viewCtrl = (MSTFirstMenuMapViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MSTFirstMenuMapViewController"];
            [self presentViewController:viewCtrl  animated:YES completion:nil];
            break;
        }
        case 5: {
            MSTFirstMenuSettingsViewController *viewCtrl = (MSTFirstMenuSettingsViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MSTFirstMenuSettingsViewController"];
            [self presentViewController:viewCtrl  animated:YES completion:nil];
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

- (void)loadDefaultView:(NSString *)title {

    backButton = [[UIButton alloc] initWithFrame:CGRectMake(20,20,57,30)];
    [backButton setTitle:@"< Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[backButton titleLabel] setFont:[UIFont systemFontOfSize:15.0f]];
    [backButton addTarget:self action:@selector(onClickBackbutton:) forControlEvents:UIControlEventTouchUpInside];
//    [backButton.titleLabel setTextColor:[UIColor colorWithRed:0.000000 green:0.478431 blue:1.000000 alpha:1.000000]];
    [backButton setTitleColor:[UIColor colorWithRed:0.000000 green:0.478431 blue:1.000000 alpha:1.000000] forState:UIControlStateNormal];

    [self.view addSubview:backButton];
    
    titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(93,24,129,30)];
    [titleLbl setText:title];
    [self.view addSubview:titleLbl];

    
    
    
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(129, 535, 56, 30)];
    [button setTitle:@"Menu" forState:UIControlStateNormal];
    [[button titleLabel] setFont:[UIFont systemFontOfSize:15.0f]];
    [button setTitleColor:[UIColor colorWithRed:0.000000 green:0.478431 blue:1.000000 alpha:1.000000] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
 

    menuView = [[UIView alloc] initWithFrame:CGRectMake( 57,380,200,150)];
    [menuView.layer setCornerRadius:8.0f];
    

    bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    [bgView setImage:[UIImage imageNamed:@"dashboardbg.png"]];
    [menuView addSubview:bgView];
    
    
    [menuView setHidden:YES];
    
    myAccButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(0,0,100,50)];
    [myAccButton setTag:1];
    [myAccButton.titleLabel setTextColor:[UIColor whiteColor]];
    [myAccButton setImage:[UIImage imageNamed:@"barcode.png"] forState:UIControlStateNormal];
    [myAccButton setTitle:@"Barcode Scan" forState:UIControlStateNormal];
    [[myAccButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];

    [myAccButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:myAccButton];

    myProButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(100,0,100,50)];
    [myProButton.titleLabel setTextColor:[UIColor whiteColor]];
    [myProButton setTag:2];
    [myProButton setImage:[UIImage imageNamed:@"credit_card.png"] forState:UIControlStateNormal];
    [myProButton setTitle:@"Credit Card" forState:UIControlStateNormal];
    [[myProButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];

    [myProButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:myProButton];

    transButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(0,50,100,50)];
    [transButton.titleLabel setTextColor:[UIColor whiteColor]];
    [transButton setTag:3];
    [transButton setImage:[UIImage imageNamed:@"mail.png"] forState:UIControlStateNormal];
    [transButton setTitle:@"Mail" forState:UIControlStateNormal];
    [[transButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];

    [transButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:transButton];

    stmtButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(100,50,100,50)];
    [stmtButton.titleLabel setTextColor:[UIColor whiteColor]];
    [stmtButton setTag:4];
    [stmtButton setImage:[UIImage imageNamed:@"map_pin.png"] forState:UIControlStateNormal];
    [stmtButton setTitle:@"Navigation" forState:UIControlStateNormal];
    [[stmtButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];

    [stmtButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:stmtButton];
    
    
    settingsButton = [[MSTCustomButton alloc] initWithFrame:CGRectMake(0,100,200,50)];
    [settingsButton.titleLabel setTextColor:[UIColor whiteColor]];//[UIColor colorWithRed:0.000000 green:0.478431 blue:1.000000 alpha:1.000000]];
    [settingsButton setTag:5];
    [settingsButton setImage:[UIImage imageNamed:@"process.png"] forState:UIControlStateNormal];
    [settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    [[settingsButton titleLabel] setFont:[UIFont systemFontOfSize:10.0f]];

    [settingsButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:settingsButton];
    
    
    
//    dragMenuView = [[UIView alloc]  initWithFrame:CGRectMake(80, 537, 150, 31)];

    
    [self.view addSubview:menuView];
    [menuView setHidden:YES];
    
    [self beautifyComponents];
}



- (void)beautifyComponents {
    
    [menuView setBackgroundColor:[UIColor lightGrayColor]];
    [menuView setHidden:YES];
    [menuView.layer setCornerRadius:8.0f];
    ismenuOpen = NO;
    
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


@end
