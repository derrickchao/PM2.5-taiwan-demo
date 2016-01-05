//
//  infoCell.h
//  PM2.5
//
//  Created by 趙子超 on 2015/12/27.
//  Copyright © 2015年 趙子超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sitenameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countyLabel;
@property (weak, nonatomic) IBOutlet UILabel *pm25Label;

@end
