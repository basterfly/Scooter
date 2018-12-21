//
//  YKTriathlon.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKTriathlon.h"

@implementation YKTriathlon

@synthesize name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"%@", @"Triatlonist"];
        self.swimmingTime = arc4random_uniform(60);
        self.swimmingDistance = arc4random_uniform(1500);
        self.runningTime = arc4random_uniform(60);
        self.runningDistance = arc4random_uniform(1500);
    }
    return self;
}

#pragma mark -- @Required methods


- (void)swim {
    [self proSwimming];
}

- (void)jump {
    NSLog(@"I am a Triatlonist, my name is %@. I am JUMP and also swim , run and ride on bike", self.name);
}

- (void)run {
    [self proRunning];
}

#pragma mark -- @Optional methods

- (void)proSwimming {
    NSLog(@"I am a Triatlonist, my name is %@.\n I am PRO Swimmer, I swim %lu min. a day and %lu meters, and also jump, run and ride on bike", name, (unsigned long)self.swimmingTime, (unsigned long)self.swimmingDistance);
}

- (void)proRunning {
    NSLog(@"I am a Triatlonist, my name is %@.\n I am PRO Runner I swim %lu min. a day and %lu meters, and also swim, jump and ride on bike", self.name, self.runningTime, self.runningDistance);
}

@end
