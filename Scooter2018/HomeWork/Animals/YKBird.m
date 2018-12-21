//
//  YKBird.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKBird.h"

@implementation YKBird

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Bird";
        self.limbs = 2;
        self.wings = 2;
    }
    return self;
}

- (void) movement {
    NSLog(@"Bird moved by it %u limbs, fly or walk. ", (unsigned int)self.limbs);
}

@end
