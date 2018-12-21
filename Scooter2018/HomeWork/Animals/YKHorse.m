//
//  YKHorse.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKHorse.h"

@implementation YKHorse

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Horse";
    }
    return self;
}
- (void) movement {
    NSLog(@"Horse moved by it %u limbs", (unsigned int)self.limbs);
}

@end
