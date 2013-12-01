//
//  CardGameResult.m
//  Matchismo
//
//  Created by 方振鹏 on 13-11-10.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "CardGameResult.h"

@interface CardGameResult()
@property (readwrite, nonatomic) NSDate * start;
@property (readwrite, nonatomic) NSDate * end;


@end

@implementation CardGameResult

#define ALL_RESULTS_KEY @"GameResult_ALL"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

- (id) initFromPropertyList : (id) plist{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary * resultDictionary = (NSDictionary *) plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] intValue];
        }
    }
    return self;
}

+ (NSArray *) allGameResults{
    NSMutableArray * allGameReults = [[NSMutableArray alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]){
        CardGameResult * gameResult = [[CardGameResult alloc] initFromPropertyList:plist];
        [allGameReults addObject:gameResult];
    }
    return allGameReults;
}

- (NSDictionary *) asPropertyList{
    return @{START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score)};
}

- (void) syschronize{
    NSMutableDictionary * mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResultsFromUserDefaults) {
        mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    }
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id) init{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (NSTimeInterval) duration{
    return [self.end timeIntervalSinceDate:self.start];
}

- (void) setScore:(int)score{
    _score = score;
    self.end = [NSDate date];
    [self syschronize];
}

@end
