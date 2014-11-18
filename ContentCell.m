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

-(void) resizeTheHeight
{
    CGFloat contentWidth = 280;
    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
    CGSize size = [txtContent.text sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 220) lineBreakMode:UILineBreakModeTailTruncation];
    
    [txtContent setFrame:CGRectMake(20, 28, 280, size.height + 60)];
    
    if (imgUrl!=nil&&![imgUrl isEqualToString:@""]) {
        [imgPhotoBtn setFrame:CGRectMake(30, size.height+70, 72, 72)];
        [centerImageView setFrame:CGRectMake(0, 0, 320, size.height+200)];
        [imgPhotoBtn setImageURL:[NSURL URLWithString:imgUrl]];
        [self imageButtonLoadedImage:imgPhotoBtn];
    }
    else
    {
        [imgPhotoBtn cancelImageLoad];
        [imgPhotoBtn setFrame:CGRectMake(120, size.height, 0, 0)];
        [centerImageView setFrame:CGRectMake(0, 0, 320, size.height+120)];
    }
    
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
