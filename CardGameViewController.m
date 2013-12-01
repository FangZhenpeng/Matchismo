//
//  CardGameViewController.m
//  Matchismo
//
//  Created by 方振鹏 on 13-10-4.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "CardMatchingGame.h"
#import "CardGameResult.h"

@interface CardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) NSUInteger flipCount;
@property (strong, nonatomic) CardMatchingGame * game;
@property (strong, nonatomic) CardGameResult * result;
@end

@implementation CardGameViewController

- (CardGameResult *) result{
    if (!_result) {
        _result = [[CardGameResult alloc] init];
    }
    return _result;
}

- (CardMatchingGame *) game{
    NSUInteger count = [self.cardButtons count];
    Deck * deck = [[Deck alloc] init];
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:count usingDeck:deck];
    }
    return _game;
}

- (void) setFlipCount:(NSUInteger)flipCount{
    _flipCount = flipCount;
    [_flipCountLabel setText:[NSString stringWithFormat:@"Flips:  %lu", (unsigned long)flipCount]];
    self.result.score = self.game.score;
}


- (IBAction)flipUp:(UIButton*)sender {
    [self.game flipAtIndex:[self.cardButtons indexOfObject:sender]];
    ++self.flipCount;
    [self updateUI];
}

- (void) updateUI{
    for (NSUInteger i = 0; i < [self.cardButtons count]; ++i) {
        Card * card = [self.game cardAtIndex:i];
        UIButton * button = self.cardButtons[i];
        button.selected = card.isFaceUp;
        button.enabled = card.playable;
        button.alpha = button.isEnabled ? 1.0 : 0.3;
    }
    [_scoreLabel setText:[NSString stringWithFormat:@"Score:  %ld", (long)self.game.score]];
}

- (void) setCardButtons:(NSArray *)buttonArray{
    _cardButtons = buttonArray;
    for (NSUInteger i = 0; i < [self.cardButtons count]; ++i) {
        Card * card = [self.game cardAtIndex:i];
        [_cardButtons[i] setTitle:[card toString] forState:UIControlStateSelected];
        [_cardButtons[i] setTitle:[card toString] forState:UIControlStateSelected | UIControlStateDisabled];
    }
    [self updateUI];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
