//
//  YKKangaroo.m
//  Scooter1
//
//  Created by Egor on 28.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKKangaroo.h"

//static const NSUInteger self

static const NSUInteger YKDefaultCountOflegs = 2;

@implementation YKKangaroo
- (instancetype)init {
    self = [super init];
    if (self) {
        self.jump = @"jump";
        self.tail = YES;
        self.movePosition = vertical;
        self.countOfLegs = YKDefaultCountOflegs;
        self.name = @"Kangaroo";
    }
    return self;
}

- (void)movement {
    NSLog(@"%@ move %@, have %lu legs, and it can %@, and has tail - %@.", self,
          (self.movePosition ? @"horizontal" : @"vertical"), self.countOfLegs, self.jump, (self.tail ? @"YES" : @"NO"));
}

@end
