//
//  CardGameResult.h
//  Matchismo
//
//  Created by 方振鹏 on 13-11-10.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardGameResult : NSObject

+ (NSArray *) allGameResults;

@property (readonly, nonatomic) NSDate * start;
@property (readonly, nonatomic) NSDate * end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

@end
