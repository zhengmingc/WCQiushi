//
//  CommentsCellTableViewCell.h
//  WCQiushi
//
//  Created by Wenwen on 2014-10-15.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsCell : UITableViewCell
@property(nonatomic, retain) UILabel *txtAuthor;
@property(nonatomic, retain) UILabel *txtContent;
@property(nonatomic, retain) UILabel *txtfloor;
@property(nonatomic, retain) UIImageView *centerImageView;
@property(nonatomic, retain) UIImageView *footView;

-(void) resizeTheHeight;
@end
