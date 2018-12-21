//
//  YKRunner.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKRunner.h"

@implementation YKRunner

@synthesize name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Runner";
        self.runningTime = arc4random_uniform(60);
        self.runningDistance = arc4random_uniform(1500);
    }
    return self;
}
#pragma mark -- @Required methods

- (void)swim {
    NSLog(@"My name is %@. I am Swim and i am PRO Runner.", self.name);
}

- (void) run {
    NSLog(@"My name is %@. I am Pro Runner and i am Swim.", self.name);
}

#pragma mark -- @Optionals methods
- (void) proRunning {
    NSLog(@"My name is %@. I am PRO Runner i run %lu min. and %lu distance a day, and i am swim", self.name, self.runningTime, self.swimmingDistance); /**<<<<<<<<<<<--*/
}

@end
