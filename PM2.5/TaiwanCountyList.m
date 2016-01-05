//
//  TaiwanCountyList.m
//  PM2.5
//
//  Created by 趙子超 on 2015/12/28.
//  Copyright © 2015年 趙子超. All rights reserved.
//

#import "TaiwanCountyList.h"

@implementation TaiwanCountyList

-(id) init
{
    self = [super init];
    
    if (self) {
        _keelungCity = [NSMutableArray array];
        _taipeiCity = [NSMutableArray array];
        _NewTaipeiCity = [NSMutableArray array];
        _taoyuanCity = [NSMutableArray array];
        _hsinchuCity = [NSMutableArray array];
        _hsinchuCounty = [NSMutableArray array];
        _miaoliCounty = [NSMutableArray array];
        _taichungCity = [NSMutableArray array];
        _changhuaCounty = [NSMutableArray array];
        _nantouCounty = [NSMutableArray array];
        _yunlinCounty = [NSMutableArray array];
        _chiayiCity = [NSMutableArray array];
        _chiayiCounty =[NSMutableArray array];
        _tainanCity = [NSMutableArray array];
        _kaohsiungCity = [NSMutableArray array];
        _pingtungCounty = [NSMutableArray array];
        _yilanCounty = [NSMutableArray array];
        _hualienCounty = [NSMutableArray array];
        _taitungCounty = [NSMutableArray array];
        _penghuCounty = [NSMutableArray array];
        _kinmenCounty = [NSMutableArray array];
        _lienchiangCounty = [NSMutableArray array];
    }
    
    return self;
}

@end
