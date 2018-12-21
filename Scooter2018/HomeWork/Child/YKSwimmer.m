//
//  YKSwimmer.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKSwimmer.h"

@implementation YKSwimmer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Swimmer1";
        self.hight = 1.5;
        self.weight = 45;
        self.sex = @"female";
    }
    return self;
}
- (void) movement {
    NSLog(@"I am a Swimmer and i swim in water");
}

@end
