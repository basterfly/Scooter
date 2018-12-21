//
//  YKPuma7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 27.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKPuma7.h"

@implementation YKPuma7
@synthesize howYouRun;
@synthesize areYouProfessional;
@synthesize runningSpeed;
@synthesize kindOfJump;

- (instancetype)init
{
    self = [super init];
    howYouRun = @"Puma can walk and run.";
    areYouProfessional = @"It can run very high speed.";
    runningSpeed = 70;
    kindOfJump = @"Puma can jump, and it can jump high on trees.";
    return self;
}

#pragma mark -- @required
- (void) intro {
    NSLog(@"%@ %@  up to %lu km/h",howYouRun, areYouProfessional, (unsigned long)runningSpeed);
    [self jump];
}

- (void) run {
    [self intro];
}

#pragma mark -- @optional
- (void) jump {
    NSLog(@"%@", kindOfJump);
}

@end
