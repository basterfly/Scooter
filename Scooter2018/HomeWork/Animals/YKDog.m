//
//  YKDog.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKDog.h"

@implementation YKDog

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Dog";
    }
    return self;
}

- (void) movement {
    NSLog(@"Dog moved by it %u limbs", (unsigned int)self.limbs);
}
@end
