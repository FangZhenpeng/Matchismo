//
//  Card.m
//  Matchismo
//
//  Created by 方振鹏 on 13-10-4.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "Card.h"


@interface Card()

@end

@implementation Card

@synthesize suit = _suit;
@synthesize rank = _rank;


static NSArray * _validSuits = nil;
static NSArray * _validRanks = nil;

- (id) init{
    self = [super init];
    if (self) {
        self.faceUp = NO;
        self.playable = YES;
    }
    return self;
}

- (int) match:(Card *)otherCard;{
    if ([self.rank isEqualToString:otherCard.rank]) {
        return 4;
    }else if ([self.suit isEqualToString:otherCard.suit]){
        return 2;
    }
    return 0;
}

- (void) setRank:(NSString *) rank{
    NSArray * validRanks = [Card getValidRanksInstance];
    if ([validRanks containsObject:rank]) {
        _rank = rank;
    }
}

- (void) setSuit:(NSString *)suit{
    NSArray * validSuits = [Card getValidSuitsInstance];
    if ([validSuits containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit{
    return _suit ? _suit : @"?";
}

- (NSString *) rank{
    return _rank ? _rank : @"?";
}

- (NSString *) toString{
    return [NSString stringWithFormat:@"%@%@", _suit, _rank];
}

+ (NSArray *) getValidRanksInstance{
    if (_validRanks == nil) {
        _validRanks = @[@"A", @"2", @"3", @"4", @"5",
                       @"6", @"7", @"8", @"9",@"10", @"J",
                       @"Q", @"K"];
    }
    return _validRanks;
}

+ (NSArray *) getValidSuitsInstance{
    if (_validSuits == nil) {
        _validSuits = @[@"♠", @"♣", @"♥", @"♦"];
    }
    return _validSuits;
}


@end
