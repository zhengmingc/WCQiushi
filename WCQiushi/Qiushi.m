//
//  Qiushi.m
//  WCQiushi
//
//  Created by Wenwen on 2014-10-15.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "Qiushi.h"

@implementation Qiushi

-(id) initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self){
        self.tag = [dictionary objectForKey:@"tag"];
        self.qiushiID = [dictionary objectForKey:@"id"];
        self.content = [dictionary objectForKey:@"content"];
        self.published_at = [[dictionary objectForKey:@"published_at"] doubleValue];
        self.commentsCount = [[dictionary objectForKey:@"comments_count"] intValue];
        
        id image = [dictionary objectForKey:@"image"];
        if(image != [NSNull null])
        {
            self.imageURL = [dictionary objectForKey:@"image"];
            NSString *newImageURL = [NSString stringWithFormat:@"http://pic.qiushibaike.com/system/pictures/%@/%@/small/%@",[_qiushiID substringToIndex:4],_qiushiID,_imageURL];
            NSString *newImageMidURL = [NSString stringWithFormat:@"http://pic.qiushibaike.com/system/pictures/%@/%@/medium/%@",[_qiushiID substringToIndex:4],_qiushiID,_imageURL];
            self.imageURL = newImageURL;
            self.imageMidURL = newImageMidURL;
        }
        
        NSDictionary *vote =[NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"votes"]];
        self.downCount = [[vote objectForKey:@"down"] intValue];
        self.upCount = [[vote objectForKey:@"up"] intValue];
        
        id user =[dictionary objectForKey:@"user"];
        if(user != [NSNull null])
        {
            NSDictionary *user =[NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"user"]];
            self.author = [user objectForKey:@"login"];
        }
        
    }
    
    return self;
}

-(void)dealloc{
    self.imageURL = nil;
    self.tag = nil;
    self.qiushiID = nil;
    self.content = nil;
    self.author = nil;
}
@end
