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
@synthesize headPhoto,tagPhoto,imgPhotoBtn;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withQS :(Qiushi *)qs
{
    _qs = qs;
    
    return [self initWithStyle:style reuseIdentifier:reuseIdentifier];
    
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        UIImage *centerImage = [UIImage imageNamed:@"block_center_background.png"];
        centerImageView = [[UIImageView alloc] initWithImage:centerImage];
        [self.contentView addSubview:centerImageView];
        
        headPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 30, 30)];
        [self.contentView addSubview:headPhoto];
        
        txtAuthor = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 200, 30)];
        [txtAuthor setFont:[UIFont fontWithName:@"Arial" size:16]];
        [txtAuthor setBackgroundColor:[UIColor clearColor]];
        [txtAuthor setTextColor:[UIColor brownColor]];
        [self.contentView addSubview:txtAuthor];
        
        
        //txtContent = [[UILabel alloc] initWithFrame:CGRectMake(20, headPhoto.frame.size.height + 10, 280, 150)];
        txtContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [txtContent setBackgroundColor:[UIColor clearColor]];
        [txtContent setFont :[UIFont fontWithName:@"Arial" size:16]];
        [txtContent setLineBreakMode:NSLineBreakByTruncatingHead];
        [txtContent setNumberOfLines:12];
        [self.contentView addSubview:txtContent];
        
    
        imgPhotoBtn = [[UIImageView alloc] init];
        //[imgPhotoBtn addTarget:self action:@selector(ImageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:imgPhotoBtn];
        
        /**
        txtTag = [[UILabel alloc] initWithFrame:CGRectMake(45, 200, 200, 30)];
        [txtTag setText:@""];
        if(_qs.tag != nil && ![_qs.tag isEqual:@""]){
           [txtTag setText:_qs.tag];
        } else {
            [txtTag setText:@""];
        }
         **/
        /**
        [goodBtn setTitle:[NSString stringWithFormat:@"%d", _qs.upCount] forState:UIControlStateNormal];
        [badBtn setTitle:[NSString stringWithFormat:@"%d", _qs.downCount] forState:UIControlStateNormal];
        [commentsBtn setTitle:[NSString stringWithFormat:@"%d", _qs.commentsCount] forState:UIControlStateNormal];
         **/
        
    }
    
    return self;
}

-(void)ImageBtnClicked:(id )sender
{
    
}

-(void) resizeTheHeight
{
  
    [footView setFrame:CGRectMake(0, centerImageView.frame.size.height, 320, 15)];
    [goodBtn setFrame:CGRectMake(10,centerImageView.frame.size.height-28,70,32)];
    [badBtn setFrame:CGRectMake(100,centerImageView.frame.size.height-28,70,32)];
    [commentsBtn setFrame:CGRectMake(230,centerImageView.frame.size.height-28,70,32)];
    [txtTag setFrame:CGRectMake(40,centerImageView.frame.size.height-50,200, 30)];
    [tagPhoto setFrame:CGRectMake(15,centerImageView.frame.size.height-50,24, 24)];
    
}

-(void) imageButtonLoadedImage:(EGOImageButton *)imageButton
{
    UIImage *image = imageButton.imageView.image;
    CGFloat w = 1.0f;
    CGFloat h = 1.0f;
    if(image.size.width > 280) {
        w = image.size.width/280;
    }
    if(image.size.width > 72) {
        h = image.size.height /72;
    }
    CGFloat scole = w>h?w:h;
    [imgPhotoBtn setFrame:CGRectMake(30, imageButton.frame.origin.y, imageButton.frame.size.width/scole, imageButton.frame.size.height/scole)];
}
@end
