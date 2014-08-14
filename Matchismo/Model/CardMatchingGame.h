//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Andrew Leung on 8/14/14.
//  Copyright (c) 2014 Andrew Leung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck;
- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly)  NSInteger score;


@end
