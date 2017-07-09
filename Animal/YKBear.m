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
        self.howToMove = @"horizontally or vertically";
        self.sharpClaws = @"sharp claws";
        self.sharpTeeth = @"sharp teth";
        self.tail = @"tail";
        self.name = @"Bear";
    }
    return self;
}

- (void) movement {
    NSLog(@"%@ move %@, have %lu legs, and it has %@, %@ and %@.", self, self.howToMove, self.countOfLegs,
          self.sharpClaws, self.sharpTeeth, self.tail);
}
@end
