//
//  CommentsCellTableViewCell.m
//  WCQiushi
//
//  Created by Wenwen on 2014-10-15.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "CommentsCell.h"

@implementation CommentsCell
@synthesize centerImageView,txtAnchor,txtContent,txtfloor;
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
        [centerImageView setFrame:CGRectMake(0, 0, 320, 320)];
        [self addSubview:centerImageView];
        
        txtContent = [[UILabel alloc]init];
        [txtContent setBackgroundColor:[UIColor clearColor]];
        [txtContent setFrame:CGRectMake(20, 32, 280, 220)];
    }
    
    return self;
}
@end
