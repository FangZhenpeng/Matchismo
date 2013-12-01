//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by 方振鹏 on 13-10-6.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property(readonly, nonatomic) NSInteger score;

- (id) initWithCardCount:(NSUInteger)count
               usingDeck:(Deck *)deck;

- (void) flipAtIndex:(NSUInteger)index;

- (Card *) cardAtIndex:(NSUInteger)index;

@end
