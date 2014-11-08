//
//  ContentCell.m
//  WCQiushi
//
//  Created by Wenwen on 2014-10-17.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell
@synthesize txtAuthor,txtContent,txtTag,centerImageView,footView,commentsBtn,goodBtn,badBtn;
@synthesize headPhoto,tagPhoto,imgMidUrl,imgUrl, imgPhotoBtn;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        UIImage *centerImage = [UIImage imageNamed:@"block_center_background.png"];
        centerImageView = [[UIImageView alloc] initWithImage:centerImage];
        [centerImageView setFrame:CGRectMake( 0, 0, 320, 220)];
        [self addSubview:centerImageView];
        
        txtContent = [[UILabel alloc] initWithFrame:CGRectMake(20, 28, 280, 220)];
        [txtContent setBackgroundColor:[UIColor clearColor]];
        [txtContent setFont :[UIFont fontWithName:@"Arial" size:16]];
        [txtContent setLineBreakMode:NSLineBreakByTruncatingTail];
        [self addSubview:txtContent];
        
        imgPhotoBtn = [[EGOImageButton alloc] initWithPlaceholderImage:[UIImage imageNamed:@"thumb_pic"] delegate:self];
        [imgPhotoBtn setFrame:CGRectMake(0, 0, 0, 0)];
        [imgPhotoBtn addTarget:self action:@selector(ImageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imgPhotoBtn];
        
        headPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 24, 24)];
        [headPhoto setImage:[UIImage imageNamed:@"thumb_avatar.png"]];
        [self addSubview:headPhoto];
        
        txtAuthor = [[UILabel alloc]initWithFrame:CGRectMake(45, 5, 200, 30)];
        [txtAuthor setText:@"Anoynmous"];
        [txtAuthor setFont:[UIFont fontWithName:@"Arial" size:16]];
        [txtAuthor setBackgroundColor:[UIColor clearColor]];
        [txtAuthor setTextColor:[UIColor brownColor]];
        [self addSubview:txtAuthor];
        
        txtTag = [[UILabel alloc] initWithFrame:CGRectMake(45, 200, 200, 30)];
        [txtTag setText:@""];
        
    }
    
    return self;
}

-(void)ImageBtnClicked:(id )sender
{
    
}

@end
