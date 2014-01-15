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


@interface MSTFirstMenuViewController ()

@end

@implementation MSTFirstMenuViewController
@synthesize menuView,button;

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
    [menuView setBackgroundColor:[UIColor grayColor]];
    [menuView setHidden:YES];
    [menuView.layer setCornerRadius:8.0f];
    ismenuOpen = NO;
//    [menuView setFrame: CGRectMake(10, 300,300, 150)];
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
        CGRect endRect = self.button.frame;//CGRectMake(300, 400, 50, 60);
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
        CGRect startRect = self.button.frame;//CGRectMake(30, 40, 50, 60);
        [menuView genieOutTransitionWithDuration:0.7
                                       startRect:startRect
                                       startEdge:BCRectEdgeTop
                                      completion:^{
                                          ismenuOpen = YES;
                                      }];
    }
    
    
}

@end
