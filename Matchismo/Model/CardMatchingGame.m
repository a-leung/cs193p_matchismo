//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Andrew Leung on 8/14/14.
//  Copyright (c) 2014 Andrew Leung. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of card

@end


@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
    
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck
{

    self = [super init]; //calling super's designated initializer
    
    if (self) {
        for (int i=0; i < count; i++) {
            Card *card = [deck drawRandomCard];
             if (card) {
                 [self.cards addObject:card];
             } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex: index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against other chosen cards
            
            for (Card *otherCard in self.cards) {
                // card matching logic
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard] ];
                    
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; //only matching 2 cards for now.
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
    
}


@end
