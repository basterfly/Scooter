//
//  YKBicyclist.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKBicyclist.h"

@implementation YKBicyclist
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Bicyclist1";
        self.hight = 1.7;
        self.weight = 75;
    }
    return self;
}

- (void) movement {
    NSLog(@"I am a Bicyclist and i moves on my bike");
}

@end
