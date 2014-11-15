//
//  ViewController.m
//  WCQiushi
//
//  Created by Wenwen on 2014-10-15.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "ViewController.h"

#define FRegsiter 101
#define FLogin    102
#define FHelp     103
#define FTop      104
#define FRecent   105
#define FSetting  106
#define FPhoto    107
#define FFourtype 108
#define FWrite    109

@interface ViewController ()
-(void) BtnClicked :(id) sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]]];
    UIImage *headImage = [UIImage imageNamed:@"head_background.png"];
    UIImageView *headView = [[UIImageView alloc] initWithImage:headImage];
    [headView setFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:headView];
    
    UIImage *logoImage = [UIImage imageNamed:@"head_logo.png"];
    _headLogoView = [[UIImageView alloc] initWithImage:logoImage];
    [_headLogoView setFrame:CGRectMake(103, 6, 113, 32)];
    [self.view addSubview:_headLogoView];
    
    _photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_photoBtn setFrame:CGRectMake(8, 6, 32, 32)];
    [_photoBtn setBackgroundImage:[UIImage imageNamed:@"icon_pic_enable.png"] forState:UIControlStateNormal];
    [_photoBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_photoBtn setTag:FPhoto];
    [_photoBtn setHidden:YES];
    [self.view addSubview:_photoBtn];
    
    _fourTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_fourTypeBtn setFrame:CGRectMake(120, 6, 80, 32)];
    [_fourTypeBtn setTitle:@"Walk arount" forState:UIControlStateNormal];
    [_fourTypeBtn.titleLabel setFont:[UIFont fontWithName:@"AppleGothic" size:18]];
    [_fourTypeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_fourTypeBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_fourTypeBtn setTag:FFourtype];
    [_fourTypeBtn setHidden:YES];
    [self.view addSubview:_fourTypeBtn];
    
    _writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_writeBtn setFrame:CGRectMake(280, 6, 32, 32)];
    [_writeBtn setImage:[UIImage imageNamed:@"icon_post_enable.png"] forState:UIControlStateNormal];
    [_writeBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_writeBtn setTag:FWrite];
    [_writeBtn setHidden:YES];
    [self.view addSubview:_writeBtn];
    
   self.m_contentView = [[ContentViewController alloc]initWithNibName:@"ContentViewController" bundle:nil];
    [_m_contentView.view setFrame:CGRectMake(0, 44, kDeviceWidth, kDeviceHeight-44*2)];
        [self.view addSubview:_m_contentView.view];
    
    UIImage *barImage = [UIImage imageNamed:@"bar_background.png"];
    UIImageView *barView = [[UIImageView alloc] initWithImage:barImage];
    [barView setFrame:CGRectMake(0, 480-4-22, 320, 44)];
    [self.view addSubview:barView];
    
    _topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_topBtn setFrame:CGRectMake(30,424,32,32)];
    [_topBtn setBackgroundImage:[UIImage imageNamed:@"icon_top_active.png"] forState:UIControlStateDisabled];
    [_topBtn setBackgroundImage:[UIImage imageNamed:@"icon_top_enable.png"] forState:UIControlStateNormal];
    [_topBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_topBtn setTag:FTop];
    [_topBtn setHidden:YES];
    [self.view addSubview:_topBtn];
    
    _recentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_recentBtn setFrame:CGRectMake(140,424,32,32)];
    [_recentBtn setBackgroundImage:[UIImage imageNamed:@"icon_new_enable.png"] forState:UIControlStateNormal];
    [_recentBtn setBackgroundImage:[UIImage imageNamed:@"icon_new_active.png"] forState:UIControlStateDisabled];
    [_recentBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_recentBtn setTag:FRecent];
    [_recentBtn setHidden:YES];
    [self.view addSubview:_recentBtn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){}
    return self;
}

-(void) BtnClicked:(id)sender{
    UIButton *btn = (UIButton *) sender;
    switch (btn.tag) {
        case FWrite:
        {
            _headLogoView.hidden = NO;
            _topBtn.hidden = YES;
            _recentBtn.hidden = YES;
            _photoBtn.hidden = YES;
            _fourTypeBtn.hidden = YES;
            _writeBtn.hidden = YES;
            
            _topBtn.enabled = NO;
            _recentBtn.enabled = NO;
            
        }break;
        case FTop:
        {
            _topBtn.enabled = NO;
            _recentBtn.enabled = YES;
            [_m_contentView LoadPageOfQiushiType:QiuShiTypeTop AndTime:QiuShiTimeRandom];
            [_fourTypeBtn setTitle:@"most funny" forState:UIControlStateNormal];
        }break;
        case FPhoto:
        {
            _topBtn.enabled = YES;
            _recentBtn.enabled = YES;
            [_m_contentView LoadPageOfQiushiType:QiuShiTypePhoto AndTime:QiuShiTimeRandom];
            [_fourTypeBtn setTitle:@"truth" forState:UIControlStateNormal];
        }break;
        case FRecent:
        {
            _topBtn.enabled = YES;
            _recentBtn.enabled = NO;
            [_m_contentView LoadPageOfQiushiType:QiuShitypeNew AndTime:QiuShiTimeRandom];
            [_fourTypeBtn setTitle:@"latest" forState:UIControlStateNormal];
        }
        default:
            break;
    }
}
@end
