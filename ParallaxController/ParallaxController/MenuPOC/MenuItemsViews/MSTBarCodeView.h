//
//  MSTBarCodeView.h
//  ParallaxController
//
//  Created by Rajkumar P on 1/21/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import <MessageUI/MessageUI.h>

@interface MSTBarCodeView : UIView <MFMailComposeViewControllerDelegate> {
    UIImageView *menuIndicatorImageView;
    UITableView *contentTableView;
}

- (void)UpdateWithImage:(UIImage *)img colorCode:(UIColor *)color titleText:(NSString *)tittle;

@end
