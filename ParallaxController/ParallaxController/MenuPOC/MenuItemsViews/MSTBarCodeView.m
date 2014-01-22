//
//  MSTBarCodeView.m
//  ParallaxController
//
//  Created by Rajkumar P on 1/21/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTBarCodeView.h"

@implementation MSTBarCodeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initilaizeSetup];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)initilaizeSetup{
    
    self.backgroundColor = [UIColor whiteColor];
    
    menuIndicatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 128, 128)];
    [menuIndicatorImageView setCenter:CGPointMake(self.frame.size.width/2, 65)];
    [menuIndicatorImageView setImage:[UIImage imageNamed:@"barcode_big.png"]];
    [self addSubview:menuIndicatorImageView];
    
    contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 130, self.frame.size.width, self.frame.size.height-130)];
    [contentTableView setBackgroundColor:[UIColor lightGrayColor]];
    [contentTableView setRowHeight:30];
    [self addSubview:contentTableView];
    
}

- (void)UpdateWithImage:(UIImage *)img colorCode:(UIColor *)color titleText:(NSString *)tittle {
    [menuIndicatorImageView setImage:img];
    [contentTableView setBackgroundColor:color];
    
}


@end
