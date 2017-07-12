//
//  YKDog.m
//  Scooter1
//
//  Created by Egor on 28.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKDog.h"

@implementation YKDog

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sharpTeeth = @"sharp teeth";
        self.tail = YES;
        self.name = @"Dog";
    }
    return self;
}

- (void)movement {
    NSLog(@"%@ move %@, have %lu legs, and it has %@, and tail - %@.", self, self.movePosition, self.countOfLegs,
                                                                       self.sharpTeeth, (self.tail ? @"YES" : @"NO"));
}

@end
