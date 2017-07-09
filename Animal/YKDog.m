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
        self.tail = @"tail";
        self.name = @"Dog";
    }
    return self;
}

- (void)movement {
    NSLog(@"%@ move %@, have %lu legs, and it has %@, and %@.", self, self.howToMove, self.countOfLegs,
                                                                self.sharpTeeth, self.tail);
}

@end
