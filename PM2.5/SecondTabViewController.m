//
//  SecondTabViewController.m
//  PM2.5
//
//  Created by 趙子超 on 2015/12/30.
//  Copyright © 2015年 趙子超. All rights reserved.
//

#import "SecondTabViewController.h"
#import "testContainerView.h"

@interface SecondTabViewController ()
@property (weak, nonatomic) testContainerView *containerViewController;

@end

@implementation SecondTabViewController

-(void) viewDidLoad
{

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}

- (IBAction)swapViews:(id)sender {
    [self.containerViewController swapViewControllers];
}
@end
