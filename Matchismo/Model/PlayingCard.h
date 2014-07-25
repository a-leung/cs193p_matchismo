//
//  PlayingCard.h
//  Matchismo
//
//  Created by Andrew Leung on 7/25/14.
//  Copyright (c) 2014 Andrew Leung. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
