//
//  MSTFirstMenuViewController.h
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTFirstMenuViewController : UIViewController {
    BOOL ismenuOpen;
    int numberOfButton;
}

@property (nonatomic,retain) IBOutlet UIView *menuView;
@property (nonatomic,retain) IBOutlet UIButton *button;
@property (nonatomic,retain) IBOutlet UIButton *backButton;

@property (nonatomic,retain) IBOutlet UIButton *myAccButton;
@property (nonatomic,retain) IBOutlet UIButton *myProButton;
@property (nonatomic,retain) IBOutlet UIButton *transButton;
@property (nonatomic,retain) IBOutlet UIButton *stmtButton;


@property (nonatomic, retain) IBOutlet UILabel *titleLbl;
@property (nonatomic) BOOL viewIsIn;


- (void)addSubviewsFromSuperclass;

- (void)loadDefaultView:(NSString *)title;
@end
