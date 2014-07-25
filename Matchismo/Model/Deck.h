//
//  Deck.h
//  Matchismo
//
//  Created by Andrew Leung on 7/25/14.
//  Copyright (c) 2014 Andrew Leung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard: (Card *)card atTop:(BOOL)atTop;
- (void) addCard: (Card *)card;

- (Card *) drawRandomCard;

@end
