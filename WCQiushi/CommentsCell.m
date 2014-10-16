//
//  CommentsCellTableViewCell.m
//  WCQiushi
//
//  Created by Wenwen on 2014-10-15.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "CommentsCell.h"

@implementation CommentsCell
@synthesize centerImageView,footView,txtAuthor,txtContent,txtfloor;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        UIImage *centerImage = [UIImage imageNamed:@"block_center_background.png"];
        centerImageView = [[UIImageView alloc] initWithImage:centerImage];
        [centerImageView setFrame:CGRectMake(0, 0, 320, 220)];
        [self addSubview:centerImageView];
        
        txtContent = [[UILabel alloc]init];
        [txtContent setBackgroundColor:[UIColor clearColor]];
        [txtContent setFrame:CGRectMake(20, 32, 280, 220)];
        [txtContent setFont:[UIFont fontWithName:@"Arial" size:16]];
        [txtContent setLineBreakMode:NSLineBreakByTruncatingTail];
        [self addSubview:txtContent];
        
        txtAuthor = [[UILabel alloc] init];
        [txtAuthor setText:@"Anoynmous"];
        [txtAuthor setFont:[UIFont fontWithName:@"Arial" size:16]];
        [txtAuthor setBackgroundColor:[UIColor clearColor]];
        [txtAuthor setTextColor:[UIColor brownColor]];
        [self addSubview:txtAuthor];
        
        txtfloor = [[UILabel alloc]init];
        [txtfloor setText:@"1"];
        [txtfloor setBackgroundColor:[UIColor clearColor]];
        [txtfloor setTextColor:[UIColor brownColor]];
        [self addSubview:txtfloor];
        
        UIImage *footImage = [UIImage imageNamed:@"block_line.png"];
        footView = [[UIImageView alloc] initWithImage:footImage];
        [footView setFrame:CGRectMake(5, txtContent.frame.size.height, 310, 2)];
        [self addSubview:footView];
        
    }
    
    
    return self;
}

-(void) resizeTheHeight
{
    CGFloat contentWidth = 280;
    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
    CGSize size = [txtContent.text sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 220) lineBreakMode:UILineBreakModeTailTruncation];
    [txtContent setFrame:CGRectMake(20, 28, 280, size.height)];
    [centerImageView setFrame:CGRectMake(0, 0, 320, size.height+30)];
    [footView setFrame:CGRectMake(5, size.height+28, 310, 2)];
}


