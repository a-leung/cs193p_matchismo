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

#define TOTALCARDS 10

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController


Deck *deck;

- (void) setFlipCount:(int)flipCount {
    
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",
                            self.flipCount];
    
    NSLog(@"flip: %d", self.flipCount);
}


- (IBAction)touchCardButton:(UIButton *)sender {


    if ([sender.currentTitle length] || self.flipCount > TOTALCARDS) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        
        //initialize the deck if it isn't
        if (!deck) {
            deck = [[PlayingCardDeck alloc ] init];
        }
        
        // get a card
        Card *card = [deck drawRandomCard];
        
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

        //setup the front.
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:[card contents] forState:UIControlStateNormal];
    }

    self.flipCount++;
    if (self.flipCount > TOTALCARDS) {
        self.flipsLabel.text = [NSString stringWithFormat:@"Sorry, out of cards!"];
    }

}


@end
