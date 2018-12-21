//
//  YKAnimal.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKAnimal.h"

@implementation YKAnimal
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Animal";
        self.limbs = 4;
        self.tail = @"i have tail";
        
    }
    return self;
}

- (void) movement {
    NSLog(@"Generally animals moved by it %u limbs", (unsigned int)self.limbs);
}

@end
