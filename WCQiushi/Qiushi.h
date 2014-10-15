//
//  Qiushi.h
//  WCQiushi
//
//  Created by Wenwen on 2014-10-15.
//  Copyright (c) 2014 com.wenwenchu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Qiushi : NSObject

@property(nonatomic, copy) NSString *imageURL;
@property(nonatomic, copy) NSString *imageMidURL;
@property(nonatomic) NSTimeInterval published_at;
@property(nonatomic, copy) NSString *tag;
@property(nonatomic, copy) NSString *qiushiID;
@property(nonatomic, copy) NSString *content;
@property(nonatomic) int commentsCount;
@property(nonatomic) int upCount;
@property(nonatomic) int downCount;
@property(nonatomic, copy) NSString *author;

-(id) initWithDictionary :(NSDictionary *) dictionary;

@end
