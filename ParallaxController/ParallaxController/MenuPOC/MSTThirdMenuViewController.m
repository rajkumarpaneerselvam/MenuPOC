//
//  MSTThirdMenuViewController.m
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTThirdMenuViewController.h"

@interface MSTThirdMenuViewController ()

@end

@implementation MSTThirdMenuViewController

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

    
    [self setupMenu];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClickBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

# pragma mark Private methods for the Menu setup

- (void)setupMenu{
    
    numberofMenuItems = 6;
    
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    NSMutableArray *menus = [[NSMutableArray alloc] init];
    
    for (int menuIndex=0; menuIndex < numberofMenuItems; menuIndex++) {
        
        AwesomeMenuItem *tempMenuItem = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed
                                                                   ContentImage:starImage
                                                        highlightedContentImage:nil];
        
        [tempMenuItem setIndex:[[NSNumber alloc] initWithInt:menuIndex+1]];
        
        [menus addObject:tempMenuItem];

    }
    
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-addbutton.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [startItem setMenuButton:YES];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem optionMenus:menus];
    menu.delegate = self;

    menu.menuWholeAngle = 3.0;
	menu.farRadius = 110.0f;
	menu.endRadius = 100.0f;
	menu.nearRadius = 90.0f;
    menu.animationDuration = 0.7f;
    menu.startPoint = CGPointMake(160.0, self.view.frame.size.height-24);
    menu.rotateAngle = 4.8f;
    
    
    [self.view addSubview:menu];
    
    selectedMenuItem = [[UILabel alloc] init];
    [selectedMenuItem setFrame:CGRectMake(10, 40, 200, 40)];

    [self.view addSubview:selectedMenuItem];

}

# pragma mark Menu delegates

- (void)awesomeMenu:(AwesomeMenu *)menu selectedItem:(AwesomeMenuItem *)item didSelectIndex:(NSInteger)idx{
    
    selectedMenuItem.text = [[NSString alloc] initWithFormat:@"Selected menu : %@",item.index];
}

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
