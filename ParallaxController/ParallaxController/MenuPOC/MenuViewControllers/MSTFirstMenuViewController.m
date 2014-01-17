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

@interface MSTFirstMenuViewController ()

@end

@implementation MSTFirstMenuViewController
@synthesize menuView,button,titleLbl,backButton;
@synthesize myAccButton;
@synthesize myProButton;
@synthesize transButton;
@synthesize stmtButton;

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
    [menuView setBackgroundColor:[UIColor lightGrayColor]];
    [menuView setHidden:YES];
    [menuView.layer setCornerRadius:8.0f];
    ismenuOpen = NO;
    
    [self addSubviewsFromSuperclass];
    
    
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
        [menuView genieInTransitionWithDuration:0.7
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
        [menuView genieOutTransitionWithDuration:0.7
                                       startRect:startRect
                                       startEdge:BCRectEdgeTop
                                      completion:^{
                                          ismenuOpen = YES;
                                      }];
    }
}


- (IBAction)onClickMenuFeatures:(id)sender {
    NSLog(@"Button %ld is clicked",(long)[sender tag]);

    switch ([sender tag]) {
        case 1: {
            MSTMyAccViewController *viewCtrl = (MSTMyAccViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MSTMyAccViewController"];
            [self presentViewController:viewCtrl  animated:YES completion:nil];
            NSLog(@"Button %ld is clicked",(long)[sender tag]);
            
//            [self performSegueWithIdentifier:@"barcodeClick" sender:self];
            break;
        }
        case 2:
             NSLog(@"Button %ld is clicked",(long)[sender tag]);
            break;
        case 3:
            NSLog(@"Button %ld is clicked",(long)[sender tag]);
            break;
        case 4:
            NSLog(@"Button %ld is clicked",(long)[sender tag]);
            break;
            
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

    [[backButton titleLabel] setFont:[UIFont systemFontOfSize:17.0f]];
    [backButton addTarget:self action:@selector(onClickBackbutton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];

    [self.view addSubview:backButton];
    
    titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(93,24,129,30)];
    [titleLbl setText:title];
    [self.view addSubview:titleLbl];
    
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(127, 486, 56, 30)];
    [button setTitle:@"Menu" forState:UIControlStateNormal];
    [[button titleLabel] setFont:[UIFont systemFontOfSize:17.0f]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
 

    menuView = [[UIView alloc] initWithFrame:CGRectMake(20,330,280,160)];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BoxyCall.png"]];
    menuView.backgroundColor = background;
    
//    [menuView setBackgroundColor:[UIColor lightGrayColor]];
    [menuView setHidden:YES];
//    [menuView.layer setCornerRadius:8.0f];
    
    
    
    
    myAccButton = [[UIButton alloc] initWithFrame:CGRectMake(33,30,60,30)];
    [myAccButton setTitle:@"My Acc" forState:UIControlStateNormal];
    [[myAccButton titleLabel] setFont:[UIFont systemFontOfSize:14.0f]];
    [myAccButton setTag:1];
    [myAccButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [myAccButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:myAccButton];

    myProButton = [[UIButton alloc] initWithFrame:CGRectMake(116,30,60,30)];
    [myProButton setTitle:@"My Pro" forState:UIControlStateNormal];
    [[myProButton titleLabel] setFont:[UIFont systemFontOfSize:14.0f]];
    [myProButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [myProButton setTag:2];
    [myProButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:myProButton];

    transButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 84,60,30)];
    [transButton setTitle:@"My Tran" forState:UIControlStateNormal];
    [[transButton titleLabel] setFont:[UIFont systemFontOfSize:14.0f]];
    [transButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [transButton setTag:3];
    [transButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:transButton];

    stmtButton = [[UIButton alloc] initWithFrame:CGRectMake(121, 84, 60,30)];
    [stmtButton setTitle:@"My Stm" forState:UIControlStateNormal];
    [[stmtButton titleLabel] setFont:[UIFont systemFontOfSize:14.0f]];
    [stmtButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [stmtButton setTag:4];
    [stmtButton addTarget:self action:@selector(onClickMenuFeatures:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:stmtButton];

    
    [self.view addSubview:menuView];
    [menuView setHidden:YES];
    
}



@end
