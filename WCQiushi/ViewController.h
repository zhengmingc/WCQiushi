//
//  ViewController.h
//  WCQiushi
//
//  Created by Wenwen on 2014-10-15.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"

@interface ViewController : UIViewController


@property(nonatomic, retain) UIView * m_helpView;
@property(nonatomic, retain) UIImageView *helpImageView;
@property(nonatomic, assign) BOOL isShowHelp;
@property(nonatomic, retain) ContentViewController * m_contentView;

@property(nonatomic, retain) UIImageView *headLogoView;
@property(nonatomic, retain) UIButton *photoBtn;
@property(nonatomic, retain) UIButton *fourTypeBtn;
@property(nonatomic, retain) UIButton *writeBtn;
@property(nonatomic, retain) UIButton *topBtn;
@property(nonatomic, retain) UIButton *recentBtn;

@end

