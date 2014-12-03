//
//  ContentCell.h
//  WCQiushi
//
//  Created by Wenwen on 2014-10-17.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageButton.h"
#import "Qiushi.h"

@interface ContentCell : UITableViewCell<EGOImageButtonDelegate>

@property(nonatomic, retain) UIImageView *headPhoto;
@property(nonatomic, retain) UIImageView *tagPhoto;
@property(nonatomic, retain) UIImageView *centerImageView;
@property(nonatomic, retain) UIImageView *footView;
@property(nonatomic, retain) UILabel *txtTag;
@property(nonatomic, retain) UILabel *txtAuthor;
@property(nonatomic, retain) UILabel *txtContent;

@property(nonatomic, retain) UIButton *goodBtn;
@property(nonatomic, retain) UIButton *badBtn;
@property(nonatomic, retain) UIButton *commentsBtn;
@property(nonatomic, retain) Qiushi *qs;

//@property(nonatomic, retain)EGOImageButton *imgPhotoBtn;
@property(nonatomic, retain) UIImageView *imgPhotoBtn;

-(void) resizeTheHeight;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withQS:(Qiushi *)qs;
@end
