//
//  ReloadPageViewController.m
//  PM2.5
//
//  Created by 趙子超 on 2016/1/3.
//  Copyright © 2016年 趙子超. All rights reserved.
//

#import "ReloadPageViewController.h"

@interface ReloadPageViewController ()

@end

@implementation ReloadPageViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    [_viewTransition getDataFromWeb];
}

@end
