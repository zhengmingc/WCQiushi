//
//  Comments.m
//  WCQiushi
//
//  Created by Wenwen on 2014-10-16.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import "Comments.h"

@implementation Comments
@synthesize commentsID,content,floor,author;

-(id) initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.commentsID = [dictionary objectForKey:@"id"];
        self.content = [dictionary objectForKey:@"content"];
        self.floor = [[dictionary objectForKey:@"floor"] intValue];
        id user = [dictionary objectForKey:@"user"];
        if(user){
            NSDictionary *user = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"user"]];
            self.author = [user objectForKey:@"login"];
        }
        
    }
    
    return self;
}

@end
