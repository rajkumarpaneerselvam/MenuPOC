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

    NSArray *subviews = [self subviews];
    for (id views in subviews) {
        [views removeFromSuperview];
    }
    if ([tittle isEqualToString:@"Locations"]) {
        [self loadMapView];
    } else if ([tittle isEqualToString:@"CreditCard"]) {
        [self loadCreaditCardView];
    } else {
        [self addSubview:menuIndicatorImageView];
        [self addSubview:contentTableView];
    }
}


- (void)loadMapView{
   [self setBackgroundColor:[UIColor lightGrayColor]];
             
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, self.frame.size.height-100)];
    [self addSubview:mapView];
             
    CLLocationCoordinate2D coord = {.latitude =  40.1480005316257, .longitude =  -82.9909833087205};
    MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion:region];
             
}
- (void)loadCreaditCardView{
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, self.frame.size.height-50)];
    [self addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://mobilebanking.chase.com/"]]];
    [webView setUserInteractionEnabled:NO];
    
}

@end
