//
//  YKRunner.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKRunner.h"

@implementation YKRunner

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Runner1";
        self.hight = 1.8;
        self.weight = 70;
    }
    return self;
}

- (void) movement {
    NSLog(@"I am a Runner and i moves by run");
}

@end
