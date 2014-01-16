//
//  MSTThirdMenuViewController.h
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"
#import "MSTEmptyView.h"

@interface MSTThirdMenuViewController : UIViewController <AwesomeMenuDelegate,AwesomeMenuItemDelegate>{
    int numberofMenuItems;
    UILabel *selectedMenuItem;
    MSTEmptyView *vw;
}

@end
