//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Andrew Leung on 7/24/14.
//  Copyright (c) 2014 Andrew Leung. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (Deck *)deck {
        
        //initialize the deck if it isn't
        if (!_deck) {
            _deck = [self createDeck];
        }
    
    return _deck;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void) setFlipCount:(int)flipCount {
    
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",
                            self.flipCount];
    
    NSLog(@"flip: %d", self.flipCount);
}


- (IBAction)touchCardButton:(UIButton *)sender {


    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;

    } else {
        
        // get a card
        Card *card = [self.deck drawRandomCard];
        
        //find it's contents
        NSString *cardContents = [card contents];
        
        //reset titleColor to black
        [sender setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        
        //set titleColor to red if we have ♦︎ or ♥︎ suit
        if ( [cardContents rangeOfString:@"♥︎"].location != NSNotFound) {
            [sender setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        }
        if ( [cardContents rangeOfString:@"♦︎"].location != NSNotFound) {
            [sender setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        }

        if (card) {
            //setup the front.
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:[card contents] forState:UIControlStateNormal];
        }
        self.flipCount++;

    }

}


@end
