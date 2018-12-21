//
//  YKHuman.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKHuman.h"

@implementation YKHuman

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Human1";
        self.hight = 0.53;
        self.weight = 3.5;
        self.sex = @"male";
    }
    return self;
}

- (void) movement {
    NSLog(@"I am a HUMAN and i moves vertically by legs");
}

@end
