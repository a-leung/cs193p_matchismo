//
//  Card.m
//  Matchismo
//
//  Created by Andrew Leung on 7/25/14.
//  Copyright (c) 2014 Andrew Leung. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards {
    
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}


@end
