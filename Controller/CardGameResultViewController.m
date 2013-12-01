//
//  CardGameResultViewController.m
//  Matchismo
//
//  Created by 方振鹏 on 13-11-10.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "CardGameResultViewController.h"
#import "CardGameResult.h"

@interface CardGameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation CardGameResultViewController


- (void) setup{
    
}

- (void) updateUI{
    NSString * displayText = @"";
    for (CardGameResult * result in [CardGameResult allGameResults]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d [%@ %g]\n", result.score, result.end, round(result.duration)];
    }
    self.display.text = displayText;
}

- (void) awakeFromNib{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setup];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
