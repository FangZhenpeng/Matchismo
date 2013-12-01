//
//  Deck.m
//  Matchismo
//
//  Created by 方振鹏 on 13-10-4.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck ()
@property(strong, nonatomic) NSMutableArray * cards;
@property(nonatomic) NSUInteger cur;

@end

@implementation Deck

-(id) init {
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc] init];
        for (NSString * suit in [Card getValidSuitsInstance]) {
            for (NSString * rank in [Card getValidRanksInstance]) {
                Card * card = [[Card alloc] init];
                card.suit = suit;
                card.rank = rank;
                [_cards addObject:card];
            }
        }
        [self shuffle];
    }
    return self;
}

-(void) shuffle{
    NSUInteger len = _cards.count;
    for (NSUInteger i = 0; i < len; ++i) {
        NSUInteger j = arc4random() % (len - i) + i;
        [_cards exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    _cur = 0;
}

-(Card *) drawCard{
    if (_cur >= 52) {
        [self shuffle];
    }
    return _cards[_cur++];
}

@end
