//
//  YKSwimmer.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKSwimmer.h"

@implementation YKSwimmer

@synthesize name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Swimmer";
        self.swimmingTime = arc4random_uniform(60);
        self.swimmingDistance = arc4random_uniform(1500);
    }
    return self;
}

#pragma mark -- @required methods
- (void)jump {
    NSLog(@"I am a Swimmer, my name is %@. I am JUMP and i am PRO swimmer", self.name);
}

- (void)swim {
    NSLog(@"I am a Swimmer, my name is %@. I am PRO swimmer", self.name);
    [self proSwimming];
}

#pragma mark -- @Optional methods

- (void)proSwimming {
    NSLog(@"I am a Swimmer, my name is %@. I am PRO swimmer i swim %lu min. and %lu distance a day, and i jump", self.name, self.swimmingTime, self.swimmingDistance);
}

@end
