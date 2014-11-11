//
//  CommentsViewController.h
//  WCQiushi
//
//  Created by Wenwen on 2014-11-10.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentCell.h"
#import "CommentsCell.h"
#import "ASIHttpHeaders.h"
#import "Qiushi.h"

@interface CommentsViewController : UIViewController

@property(nonatomic,retain) UITableView * commentsView;
@property(nonatomic,retain) UITableView * tableView;
@property(nonatomic,retain) NSMutableArray * list;
@property(nonatomic,retain) ASIHTTPRequest *asiRequest;
@property(nonatomic,retain) Qiushi * qs;

-(CGFloat) getTheHeight;
-(CGFloat) getTheCellHeight:(int) row;

@end
