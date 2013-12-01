//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by 方振鹏 on 13-10-6.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property(strong, nonatomic) NSMutableArray * cards;
@property(readwrite, nonatomic) NSInteger score;
@end

@implementation CardMatchingGame

#define MATCH_BONUS         (4)
#define MISMATCH_PENALTY    (-2)
#define FLIP_COST           (-1)


- (NSMutableArray *) cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id) init{
    return [self initWithCardCount:35 usingDeck:[[Deck alloc] init]];
}

- (id) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if (self) {
        for (unsigned i = 0; i < count; ++i) {
            Card * card = [deck drawCard];
            [self.cards addObject:card];
        }
    }
    return self;
}

- (void) flipAtIndex:(NSUInteger)index{
    Card * card = [self cardAtIndex:index];
    if (card.isPlayable) {
        if (!card.isFaceUp) {
            for (Card * otherCard in self.cards) {
                if (otherCard.isPlayable && otherCard.isFaceUp)
                {
                    int matchScore = [card match:otherCard];
                    if(matchScore) {
                        otherCard.playable = NO;
                        card.playable = NO;
                        self.score += matchScore * MATCH_BONUS;
                    }
                    else{
                        otherCard.faceUp = NO;
                        self.score += MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score += FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
        NSLog(@"=====> faceUp %s\n", card.isFaceUp ? "YES" : "NO");
    }
}

- (Card *) cardAtIndex:(NSUInteger)index{
    return self.cards[index];
}

@end
