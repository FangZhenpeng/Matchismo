//
//  Card.h
//  Matchismo
//
//  Created by 方振鹏 on 13-10-4.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString * suit;
@property(nonatomic) NSString * rank;
@property(nonatomic, getter = isPlayable) BOOL playable;
@property(nonatomic, getter = isFaceUp) BOOL faceUp;

+ (NSArray *) getValidSuitsInstance;
+ (NSArray *) getValidRanksInstance;
- (NSString *) toString;
- (int) match:(Card *)otherCard;

@end

