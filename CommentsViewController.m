//
//  CommentsViewController.m
//  WCQiushi
//
//  Created by Wenwen on 2014-11-10.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "CommentsViewController.h"
#import "CJSONDeserializer.h"
#import "Comments.h"

#define FShareBtn 101
#define FBackBtn 102
#define FAddComments 103

@interface CommentsViewController ()<ASIHTTPRequestDelegate,
UITableViewDataSource,
UITableViewDelegate>

@property(nonatomic) BOOL refreshing;
-(void) GetErr:(ASIHTTPRequest *)request;
-(void) GetResult :(ASIHTTPRequest *)request;
-(void) BtnClicked :(id)sender;
-(void) loadData;

@end

@implementation CommentsViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]]];
    _list = [[NSMutableArray alloc] init];
    
    UIImage *headImage = [UIImage imageNamed:@"head_background.png"];
    UIImageView *headView = [[UIImageView alloc] initWithImage:headImage];
    [headView setFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:headView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(10, 6, 32, 32)];
    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backBtn setTag:FBackBtn];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setFrame:CGRectMake(280, 6, 32,32)];
    [shareBtn setImage:[UIImage imageNamed:@"icon_share.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setTag:FShareBtn];
    [self.view addSubview:shareBtn];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, [self getTheHeight]-60)];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.scrollEnabled = YES;
    _commentsView.tableHeaderView = _tableView;
    _asiRequest = nil;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    UIImage *footBg = [UIImage imageNamed:@"block_center_background.png"];
    UIImageView *footBgView = [[UIImageView alloc] initWithImage:footBg];
    [footBgView setFrame:CGRectMake(0, 0, 320, 25)];
    [footView addSubview:footBgView];
    
    UIImage *footImage = [UIImage imageNamed:@"block_foot_background.png"];
    UIImageView *footImageView = [[UIImageView alloc] initWithImage:footImage];
    [footImageView setFrame:CGRectMake(0, 25, 320, 15)];
    [footView addSubview:footImageView];
    
    UIButton *addComments = [UIButton buttonWithType:UIButtonTypeCustom];
    [addComments setFrame:CGRectMake(20, 2, 280, 28)];
    [addComments setBackgroundImage:[[UIImage imageNamed:@"button_vote.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]
                           forState:UIControlStateNormal];
    [addComments setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [addComments.titleLabel setFont:[UIFont fontWithName:@"Arial" size:41]];
    [addComments setTitle:@"tap to comments" forState:UIControlStateNormal];
    [addComments addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [addComments setTag:FAddComments];
    [footView addSubview:addComments];
    
    _commentsView.tableFooterView = footView;
    [_commentsView addSubview:footView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 6, 180, 32)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Arial" size:18]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:[NSString stringWithFormat:@"Joke#%@",_qs.qiushiID]];
    [self.view addSubview:label];
    
    [self loadData];
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

#pragma mark - Actions
-(void)loadData{
    [_list removeAllObjects];
    NSURL *url = [NSURL URLWithString:CommentSURLString(_qs.qiushiID)];
    _asiRequest = [ASIHTTPRequest requestWithURL:url];
    [_asiRequest setDelegate:self];
    [_asiRequest setDidFinishSelector:@selector(GetResult:)];
    [_asiRequest setDidFailSelector:@selector(GetErr:)];
    [_asiRequest startAsynchronous];
        
}

-(void) GetErr:(ASIHTTPRequest *)request
{

}

-(void) GetResult:(ASIHTTPRequest *)request
{
    NSData *data = [request responseData];
    NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:data error:nil];
    if([dictionary objectForKey:@"items"]){
        NSArray *array = [NSArray arrayWithArray:[dictionary objectForKey:@"items"]];
        for (NSDictionary *qiushi in array ) {
            Comments *cm = [[Comments alloc] initWithDictionary:qiushi];
            [_list addObject:cm];
        }
    }
    [_commentsView reloadData];
}

#pragma mark - TableView*
@end
