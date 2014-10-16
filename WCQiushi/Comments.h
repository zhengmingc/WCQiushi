//
//  Comments.h
//  WCQiushi
//
//  Created by Wenwen on 2014-10-16.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comments : NSObject

@property(nonatomic, assign) int floor;
@property(nonatomic, copy) NSString *commentsID;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, copy) NSString *author;
-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
