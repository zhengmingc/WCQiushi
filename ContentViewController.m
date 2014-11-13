//
//  ContentViewController.m
//  WCQiushi
//
//  Created by Wenwen on 2014-11-12.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "ContentViewController.h"
#import "PullingRefreshTableView.h"
#import "tooles.h"
#import "CJSONDeserializer.h"
#import "Qiushi.h"

@interface ContentViewController ()<
PullingRefreshTableViewDelegate,
ASIHTTPRequestDelegate,
UITableViewDataSource,
UITableViewDelegate
>
-(void)GetErr:(ASIHTTPRequest *)request;
-(void)GetResult:(ASIHTTPRequest *)request;

@property(nonatomic, retain) PullingRefreshTableView *tableView;
@property(nonatomic, retain) NSMutableArray *list;
@property(nonatomic) BOOL refreshing;
@property(nonatomic, assign) NSInteger page;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor clearColor]];
    _list = [[NSMutableArray alloc] init];
    
    CGRect bounds = self.view.bounds;
    bounds.size.height  -= 44.f*2;
    self.tableView = [[PullingRefreshTableView alloc] initWithFrame:bounds pullingDelegate:self];
    _tableView.separatorColor = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    _asiRequest = nil;
    
    if(self.page == 0) {
        [self.tableView launchRefreshing];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) loadData{
    self.page++;
    NSURL *url;
    switch (_qiuTime) {
        case QiuShiTimeRandom:
            url = [NSURL URLWithString:LatestURLString(10, self.page)];
            break;
        case QiuShiTimeDay:
            url = [NSURL URLWithString:DayURLString(10, self.page)];
            break;
        case QiuShiTimeWeek:
            url = [NSURL URLWithString:WeakURlString(10, self.page)];
            break;
        case QiuShiTimeMonth:
            url = [NSURL URLWithString:MonthURLString(10, self.page)];
        default:
            break;
    }
    
    switch (_qiuType) {
        case QiuShiTypeTop:
            url = [NSURL URLWithString:SuggestURLString(10, self.page)];
            break;
        case QiuShitypeNew:
            url = [NSURL URLWithString:LatestURLString(10, self.page)];
            break;
        case QiuShiTypePhoto:
            url = [NSURL URLWithString:ImageURLString(10, self.page)];
            break;
            
        default:
            break;
    }
    _asiRequest = [ASIHTTPRequest requestWithURL:url];
    [_asiRequest setDelegate:self];
    [_asiRequest setDidFinishSelector:@selector(GetResult:)];
    [_asiRequest setDidFailSelector:@selector(GetErr:)];
    [_asiRequest startAsynchronous];
}

-(void)GetErr:(ASIHTTPRequest *)request
{
    self.refreshing = NO;
    [self.tableView tableViewDidFinishedLoading];
    [tooles MsgBox:@"Connection failed"];
}

-(void) GetResult:(ASIHTTPRequest *)request
{
    if(self.refreshing) {
        self.page = 1;
        self.refreshing = NO;
        [self.list removeAllObjects];
    }
    NSData * data = [request responseData];
    NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserialize:data error:nil];
    if([dictionary objectForKey:@"items"]){
        NSArray *array = [NSArray arrayWithArray:[dictionary objectForKey:@"items"]];
        for(NSDictionary *qiushi in array){
            Qiushi *qs = [[Qiushi alloc] initWithDictionary:qiushi];
            [self.list addObject:qs];
        }
    }
    
    if(self.page >=20){
        [self.tableView tableViewDidFinishedLoadingWithMessage:@"No more .."];
        self.tableView.reachedTheEnd = NO;
        [self.tableView reloadData];
    } else {
        [self.tableView tableViewDidFinishedLoading];
        self.tableView.reachedTheEnd = NO;
        [self.tableView reloadData];
    }
}

@end
