//
//  YKBear.m
//  Scooter1
//
//  Created by Egor on 28.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKBear.h"

@implementation YKBear
- (instancetype)init {
    self = [super init];
    if (self) {
        self.movePosition = horizontal;
        self.sharpClaws = @"sharp claws";
        self.sharpTeeth = @"sharp teth";
        self.tail = YES;
        self.name = @"Bear";
    }
    return self;
}

- (void) movement {
    NSLog(@"%@ move %@, have %lu legs, and it has %@, %@ and tail - %@.", self, (self.movePosition ? @"horizontal" : @"vertical"), self.countOfLegs, self.sharpClaws, self.sharpTeeth, (self.tail ? @"YES" : @"NO"));
}
@end
