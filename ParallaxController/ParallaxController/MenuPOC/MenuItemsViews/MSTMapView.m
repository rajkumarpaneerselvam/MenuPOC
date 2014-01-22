//
//  MSTMapView.m
//  ParallaxController
//
//  Created by Rajkumar P on 1/21/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTMapView.h"
#import "MapKit/MapKit.h"

@implementation MSTMapView

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
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, self.frame.size.height-100)];
    [self addSubview:mapView];
    
    CLLocationCoordinate2D coord = {.latitude =  40.1480005316257, .longitude =  -82.9909833087205};
    MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
    MKCoordinateRegion region = {coord, span};

    [mapView setRegion:region];
    

}

@end
