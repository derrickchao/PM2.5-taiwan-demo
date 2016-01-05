//
//  ViewController.h
//  PM2.5
//
//  Created by 趙子超 on 2015/12/26.
//  Copyright © 2015年 趙子超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaiwanCountyList.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,NSURLSessionTaskDelegate,NSURLSessionDataDelegate,NSURLSessionDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TaiwanCountyList *allAirData;
@property (strong, nonatomic) NSMutableArray *taiwanAllCounty;
@property (strong, nonatomic) NSArray *rawData;

-(void) getDataFromWeb;
- (IBAction)refreshData:(id)sender;

@end

