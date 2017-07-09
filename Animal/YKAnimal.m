//
//  YKAnimal.m
//  Scooter1
//
//  Created by Egor on 28.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKAnimal.h"

static const NSUInteger YKDefaultCountOflegs = 4;

@implementation YKAnimal

- (instancetype)init {
    self = [super init];
    if (self) {
        self.howToMove = @"horizontally";
        self.countOfLegs = YKDefaultCountOflegs;
        self.name = @"No name";
    }
    return self;
}

- (void)movement {
    NSLog(@"Basically animals move %@, and have %lu legs.", self.howToMove, self.countOfLegs);
}

- (void)type {
    NSLog(@"Type is - %@", self);
}

@end
