//
//  MSTThirdMenuViewController.m
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTThirdMenuViewController.h"
#import "MSTBarCodeViewController.h"
#import "MSTBarCodeView.h"
#import "MSTCredicardView.h"
#import "MSTmailView.h"
#import "MSTMapView.h"
#import "MSTSettingsView.h"


@interface MSTThirdMenuViewController (){
    
    MSTBarCodeView *barcodeView;
    MSTCredicardView *creditCardView;
    MSTmailView *mailView;
    MSTMapView *mapView;
    MSTSettingsView *settingsView;
    
}
@end


@implementation MSTThirdMenuViewController

@synthesize index = _index;

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
	   
    [self setupMenu];
    
    _index =[NSNumber numberWithInt:0];
    [self.menuItemContainerView setFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
    
    previousIndex = 0;
}

- (void)viewDidAppear:(BOOL)animated{
    [startItem registerForNotification];
    [barcode registerForNotification];
    [creditcard registerForNotification];
    [mail registerForNotification];
    [mappin registerForNotification];
    [process registerForNotification];
}

- (void)viewDidDisappear:(BOOL)animated{
    [startItem deregisterForNotification];
    [barcode deregisterForNotification];
    [creditcard deregisterForNotification];
    [mail deregisterForNotification];
    [mappin deregisterForNotification];
    [process deregisterForNotification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onClickBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

# pragma mark Private methods for the Menu setup

- (void)setupMenu{
    
    
    NSMutableArray *menus = [[NSMutableArray alloc] init];
    
    startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-menuitem.png"]
                                      highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                          ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                               highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [startItem setMenuButton:YES];
    
    barcode = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"barcode.png"]
                                    highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                        ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                             highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    
    [barcode setIndex:[[NSNumber alloc] initWithInt:1]];
    [menus addObject:barcode];
    
    creditcard = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"credit_card.png"]
                                       highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [creditcard setIndex:[[NSNumber alloc] initWithInt:2]];
    [menus addObject:creditcard];
    
    mail = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"mail.png"]
                                 highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                     ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                          highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [mail setIndex:[[NSNumber alloc] initWithInt:3]];
    [menus addObject:mail];
    
    mappin = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"map_pin.png"]
                                   highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                       ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                            highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [mappin setIndex:[[NSNumber alloc] initWithInt:4]];
    [menus addObject:mappin];
    
    
    process = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"process.png"]
                                    highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                        ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                             highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [process setIndex:[[NSNumber alloc] initWithInt:5]];
    [menus addObject:process];
    
    
    
    menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem optionMenus:menus];
    menu.delegate = self;
    
    menu.menuWholeAngle = 3.0;
	menu.farRadius = 62.0f;
	menu.endRadius = 60.0f;
	menu.nearRadius = 55.0f;
    menu.animationDuration = 0.75f;
    menu.startPoint = CGPointMake(160.0, self.view.frame.size.height-24);
    menu.rotateAngle = 4.8f;
    
    
    [self.view addSubview:menu];
    
}

# pragma mark Menu delegates

- (void)awesomeMenu:(AwesomeMenu *)selectedmenu selectedItem:(AwesomeMenuItem *)item didSelectIndex:(NSInteger)idx{
    
    selectedMenuItem.text = [[NSString alloc] initWithFormat:@"Selected menu : %@",item.index];
    NSLog(@"Stacked View controllers %@",[self.navigationController viewControllers]);
    
    if(_index){
        if (([item.index isEqualToNumber:[NSNumber numberWithInt:1]]) && (![item.index isEqualToNumber:_index]))
        {
            
            if(!barcodeView){
                barcodeView = [[MSTBarCodeView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:barcodeView];
            }
            
            if (idx > previousIndex) {
                [self animateViewRighttoLeft:barcodeView];
            }else{
                [self animateViewLefttoRight:barcodeView];
            }
            
            previousIndex = idx;
            
            //        [self performSegueWithIdentifier:@"barcodeClick" sender:self];
        }else if (([item.index isEqualToNumber:[NSNumber numberWithInt:2]]) && (![item.index isEqualToNumber:_index]))
        {
            if(!creditCardView){
                creditCardView = [[MSTCredicardView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:creditCardView];
            }
            
            if (idx > previousIndex) {
                [self animateViewRighttoLeft:creditCardView];
            }else{
                [self animateViewLefttoRight:creditCardView];
            }
            
            previousIndex = idx;
            
            //        [self performSegueWithIdentifier:@"creditcard" sender:self];
        }else if (([item.index isEqualToNumber:[NSNumber numberWithInt:3]]) && (![item.index isEqualToNumber:_index]))
        {
            if(!mailView){
                mailView = [[MSTmailView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:mailView];
            }
            
            if (idx > previousIndex) {
                [self animateViewRighttoLeft:mailView];
            }else{
                [self animateViewLefttoRight:mailView];
            }
            
            previousIndex = idx;
            
            //        [self performSegueWithIdentifier:@"mail" sender:self];
        }
        else if (([item.index isEqualToNumber:[NSNumber numberWithInt:4]]) && (![item.index isEqualToNumber:_index]))
        {
            
            if(!mapView){
                mapView = [[MSTMapView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:mapView];
            }
            
            if (idx > previousIndex) {
                [self animateViewRighttoLeft:mapView];
            }else{
                [self animateViewLefttoRight:mapView];
            }
            
            previousIndex = idx;
            
            //        [self performSegueWithIdentifier:@"map" sender:self];
        }
        else if (([item.index isEqualToNumber:[NSNumber numberWithInt:5]]) && (![item.index isEqualToNumber:_index]))
        {
            if(!settingsView){
                settingsView = [[MSTSettingsView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
                [self.view addSubview:settingsView];
            }
            
            if (idx > previousIndex) {
                [self animateViewRighttoLeft:settingsView];
            }else{
                [self animateViewLefttoRight:settingsView];
            }
            
            previousIndex = idx;
            
            //        [self performSegueWithIdentifier:@"settings" sender:self];
        }
    }
    
}

- (void)animateViewRighttoLeft:(UIView *)viewRef{
    
    [viewRef setFrame:CGRectMake(320, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
    
    [UIView animateWithDuration:0.3 animations:^{
        [viewRef setFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
        
    }];
    [self.view bringSubviewToFront:viewRef];
    [self.view bringSubviewToFront:menu];
}

- (void)animateViewLefttoRight:(UIView *)viewRef{
    
    [viewRef setFrame:CGRectMake(-320, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
    
    [UIView animateWithDuration:0.3 animations:^{
        [viewRef setFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100)];
        
    }];
    [self.view bringSubviewToFront:viewRef];
    [self.view bringSubviewToFront:menu];
}



//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//
//    if ([[segue identifier] isEqualToString:@"barcodeClick"])
//    {
//        MSTBarCodeViewController *translationQuizAssociateVC = [segue destinationViewController];
//    }else
//
//}

- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu{
    
}

- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu{
}

# pragma mark Menu items delegates

- (void)AwesomeMenuItemTouchesBegan:(AwesomeMenuItem *)item{
    
}

- (void)AwesomeMenuItemTouchesEnd:(AwesomeMenuItem *)item{
    
}

- (void)AwesomeMenuItemTouchesMoved:(AwesomeMenuItem *)item{
    
}


@end
