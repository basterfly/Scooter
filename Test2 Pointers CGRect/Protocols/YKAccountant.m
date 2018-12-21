//
//  YKAccountant.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 05.11.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKAccountant.h"
@implementation YKAccountant
@synthesize name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Accountant";
        self.hightOfJump = arc4random_uniform(2);
        self.lengthOfJump = arc4random_uniform(6);
    }
    return self;
}

#pragma mark -- @Required methods
- (void)swim {
    NSLog(@"My name is %@. I like sport and i SWIM, run and Jump.", self.name);
}

- (void)jump {
    NSLog(@"My name is %@. I like sport and i JUMP, run and swim.", self.name);
}

- (void)run {
    NSLog(@"My name is %@. I like sport and i RUN, swim and Jump.", self.name);
}

#pragma mark -- @Optional methods
- (void)jumpUp {
    NSLog(@"My name is %@. I like sport and i RUN, swim and Jump. I am not proffesional jamper but i JumpUp on %lu m. and JumpLong %lu m.", self.name, self.hightOfJump, self.lengthOfJump);
}

- (void) jumpLong {
    NSLog(@"My name is %@. I like sport and i RUN, swim and Jump. I am not proffesional jamper but i JumpUp on %lu m. and JumpLong %lu m.", self.name, self.hightOfJump, self.lengthOfJump);
}

@end
