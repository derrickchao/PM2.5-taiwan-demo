//
//  FavoriteTableViewController.m
//  PM2.5
//
//  Created by 趙子超 on 2016/1/4.
//  Copyright © 2016年 趙子超. All rights reserved.
//

#import "FavoriteTableViewController.h"
#import "ViewController.h"
#import "SelectedCityViewController.h"

@interface FavoriteTableViewController ()
@property (nonatomic, strong) ViewController *viewCtrller;

@end

@implementation FavoriteTableViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    _viewCtrller = (ViewController *) ([[(UINavigationController*)[self.tabBarController.viewControllers firstObject] viewControllers] objectAtIndex:0]);
    NSLog(@"This is FavoriteView!!");
//    NSLog(@"%@",_viewCtrller.taiwanAllCounty);
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"selectCity"]) {
        SelectedCityViewController *dest = segue.destinationViewController;
        dest.viewCtrller = self.viewCtrller;
    }
}

@end
