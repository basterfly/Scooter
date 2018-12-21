//
//  YKDriver.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKDriver.h"

@implementation YKDriver
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Driver1";
        self.hight = 1.7;
        self.weight = 90;
        self.age = 30;
        self.drivingExperience = 10;
    }
    return self;
}

- (void) movement {
    [super movement];
    NSLog(@"But I am professional DRIVER so I drive my car!");
}
@end
