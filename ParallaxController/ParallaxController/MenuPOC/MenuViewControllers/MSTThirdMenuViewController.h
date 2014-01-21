//
//  MSTThirdMenuViewController.h
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"

@interface MSTThirdMenuViewController : UIViewController <AwesomeMenuDelegate,AwesomeMenuItemDelegate>{
    int numberofMenuItems;
    UILabel *selectedMenuItem;
    
    AwesomeMenuItem *startItem;
    AwesomeMenuItem *barcode;
    AwesomeMenuItem *creditcard;
    AwesomeMenuItem *mail;
    AwesomeMenuItem *mappin;
    AwesomeMenuItem *process;
    AwesomeMenu *menu;
    
    NSInteger previousIndex;
}

@property (nonatomic, strong) NSNumber *index;
@property (nonatomic, retain) IBOutlet UIView *menuItemContainerView;

@end
