//
//  SelectedCityViewController.m
//  PM2.5
//
//  Created by 趙子超 on 2016/1/5.
//  Copyright © 2016年 趙子超. All rights reserved.
//

#import "SelectedCityViewController.h"

@interface SelectedCityViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *cities;
@property NSInteger siteCount;
@end

@implementation SelectedCityViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    _siteCount = 0;
    NSLog(@"This is SelectedView!!");
    for ( NSMutableArray *temp in _viewCtrller.taiwanAllCounty) {
        for ( int i = 0; i < temp.count; ++i) {
            NSLog(@"%@", [[temp objectAtIndex: i] objectForKey: @"SiteName"]);
            ++_siteCount;
        }
    }
    
    NSLog(@"%li",(long)_siteCount);
    NSLog(@"%@", _viewCtrller.rawData);
}

- (IBAction)cancelSelect:(id)sender {
    [self dismissViewControllerAnimated: YES completion: nil];
}

#pragma mark - UITableViewDelegate

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _siteCount;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"selectCitiesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];

    UILabel *cityLabel = (UILabel *) [cell viewWithTag: 100];
    cityLabel.text = @"你好";
    
    return cell;
}

@end
