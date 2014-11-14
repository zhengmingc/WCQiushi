//
//  ContentViewController.h
//  WCQiushi
//
//  Created by Wenwen on 2014-11-12.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHttpHeaders.h"

@interface ContentViewController : UIViewController

@property(nonatomic, retain) ASIHTTPRequest *asiRequest;
@property(nonatomic, assign) QiuShiType qiuType;
@property(nonatomic, assign) QiuShiTime qiuTime;

-(void) LoadPageOfQiushiType:(QiuShiType) type AndTime:(QiuShiTime) time;
-(CGFloat) getTheHeight:(NSInteger) row;
@end
