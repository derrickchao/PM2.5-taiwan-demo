//
//  ViewController.m
//  PM2.5
//
//  Created by 趙子超 on 2015/12/26.
//  Copyright © 2015年 趙子超. All rights reserved.
//

#import "ViewController.h"
#import "infoCell.h"
//#import "TaiwanCountyList.h"
#import "ReloadPageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self getDataFromWeb];
    
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
}

-(void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getDataFromWeb
{
    NSString *urlTarget = @"http://opendata2.epa.gov.tw/AQX.json";
//    NSString *urlTarget = @"http://opendata.epa.gov.tw/ws/Data/REWXQA/?$orderby=SiteName&$skip=0&$top=1000&format=json";
    NSURL *url = [NSURL URLWithString: urlTarget];
    
    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: defaultConfig];
    NSURLSessionDataTask *task = [session dataTaskWithURL: url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *) response;
        if (httpResp.statusCode == 200) {
            NSError *jsonError;
            if (data != nil)
            _rawData = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &jsonError];
            
            if ( !jsonError ){
                _allAirData = [[TaiwanCountyList alloc] init];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    for ( NSDictionary *tempDict in _rawData) {
                        if ([[tempDict objectForKey:@"County"] isEqualToString: @"基隆市"]){
                            [_allAirData.keelungCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"臺北市"]) {
                            [_allAirData.taipeiCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"新北市"]){
                            [_allAirData.NewTaipeiCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"桃園市"]){
                            [_allAirData.taoyuanCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"新竹縣"]){
                            [_allAirData.hsinchuCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"新竹市"]){
                            [_allAirData.hsinchuCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"苗栗縣"]){
                            [_allAirData.miaoliCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"臺中市"]){
                            [_allAirData.taichungCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"彰化縣"]){
                            [_allAirData.changhuaCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"南投縣"]){
                            [_allAirData.nantouCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"雲林縣"]){
                            [_allAirData.yunlinCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"嘉義縣"]){
                            [_allAirData.chiayiCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"嘉義市"]){
                            [_allAirData.chiayiCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"臺南市"]){
                            [_allAirData.tainanCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"高雄市"]){
                            [_allAirData.kaohsiungCity addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"屏東縣"]){
                            [_allAirData.pingtungCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"宜蘭縣"]){
                            [_allAirData.yilanCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"花蓮縣"]){
                            [_allAirData.hualienCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"臺東縣"]){
                            [_allAirData.taitungCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"澎湖縣"]){
                            [_allAirData.penghuCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"金門縣"]){
                            [_allAirData.kinmenCounty addObject: tempDict];
                        }else if ([[tempDict objectForKey:@"County"] isEqualToString: @"連江縣"]){
                            [_allAirData.lienchiangCounty addObject: tempDict];
                        }
                    }
                    
                    _taiwanAllCounty = [NSMutableArray arrayWithObjects: _allAirData.keelungCity, _allAirData.taipeiCity, _allAirData.NewTaipeiCity, _allAirData.taoyuanCity, _allAirData.hsinchuCounty, _allAirData.hsinchuCity, _allAirData.miaoliCounty, _allAirData.taichungCity, _allAirData.changhuaCounty, _allAirData.nantouCounty, _allAirData.yunlinCounty, _allAirData.chiayiCounty, _allAirData.chiayiCity,_allAirData.tainanCity, _allAirData.kaohsiungCity, _allAirData.pingtungCounty, _allAirData.yilanCounty, _allAirData.hualienCounty, _allAirData.taitungCounty, _allAirData.penghuCounty, _allAirData.kinmenCounty, _allAirData.lienchiangCounty, nil];
                    
//                    NSLog(@"%@", _taiwanAllCounty);
                    [UIView transitionWithView: self.tableView duration: 1.0f options:UIViewAnimationOptionTransitionCurlDown
                                    animations:^{
                        [self.tableView reloadData];}
                                    completion:^(BOOL isFinished){
                                        NSLog(@"OKay");}];
                    [self dismissViewControllerAnimated: YES completion: nil];
                });
            }
        }
    }];
    
    [task resume];
}

#pragma mark - NSURLSessionTaskDelegate

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    NSLog(@"Display");
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSLog(@"??");
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"Run??");

}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    NSLog(@"Run?");
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_taiwanAllCounty count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_taiwanAllCounty objectAtIndex: section] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"基隆市";
            break;
        case 1:
            return @"臺北市";
            break;
        case 2:
            return @"新北市";
            break;
        case 3:
            return @"桃園市";
            break;
        case 4:
            return @"新竹縣";
            break;
        case 5:
            return @"新竹市";
            break;
        case 6:
            return @"苗栗縣";
            break;
        case 7:
            return @"臺中市";
            break;
        case 8:
            return @"彰化縣";
            break;
        case 9:
            return @"南投縣";
            break;
        case 10:
            return @"雲林縣";
            break;
        case 11:
            return @"嘉義縣";
            break;
        case 12:
            return @"嘉義市";
            break;
        case 13:
            return @"臺南市";
            break;
        case 14:
            return @"高雄市";
            break;
        case 15:
            return @"屏東縣";
            break;
        case 16:
            return @"宜蘭縣";
            break;
        case 17:
            return @"花蓮縣";
            break;
        case 18:
            return @"臺東縣";
            break;
        case 19:
            return @"澎湖縣";
            break;
        case 20:
            return @"金門縣";
            break;
        case 21:
            return @"連江縣";
            break;
        default:
            return @"";
            break;
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"pollutionData";
    infoCell *cell = (infoCell *) [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if ( cell == nil){
        cell = [[infoCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.sitenameLabel.text = [[[_taiwanAllCounty objectAtIndex: indexPath.section] objectAtIndex:indexPath.row ] objectForKey:@"SiteName"];
    cell.countyLabel.text = [[[_taiwanAllCounty objectAtIndex: indexPath.section] objectAtIndex:indexPath.row ] objectForKey:@"County"];
    cell.pm25Label.text = [[[_taiwanAllCounty objectAtIndex: indexPath.section] objectAtIndex:indexPath.row ] objectForKey:@"FPMI"];
    
    NSInteger pm25Value = [cell.pm25Label.text integerValue];
//    UIView *backgView = [[UIView alloc] initWithFrame: cell.frame];
//    backgView.backgroundColor = [UIColor redColor];
    if ( pm25Value <= 3 ) {
        cell.backgroundColor = [UIColor greenColor];
    }else if ( pm25Value > 3 && pm25Value <= 6){
        cell.backgroundColor = [UIColor orangeColor];
    }else if ( pm25Value > 6 && pm25Value <= 9) {
        cell.backgroundColor = [UIColor redColor];
    }else if ( pm25Value >= 10) {
        cell.backgroundColor = [UIColor purpleColor];
    }
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"reloadData"]) {
        ReloadPageViewController *dest = segue.destinationViewController;
        dest.viewTransition = self;
    }
}

- (IBAction)refreshData:(id)sender {
//    UIViewController *reload = [[UIViewController alloc] init];
//    reload.view.backgroundColor = [UIColor whiteColor];
//    [self presentViewController: reload animated: YES completion: ^{
//    [_taiwanAllCounty removeAllObjects];
//    [self getDataFromWeb];
//    }];
    [_taiwanAllCounty removeAllObjects];
}
@end
