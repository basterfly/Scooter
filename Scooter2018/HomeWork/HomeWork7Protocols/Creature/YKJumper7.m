//
//  YKJumper7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 27.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKJumper7.h"

@implementation YKJumper7
@synthesize kindOfJump;
@synthesize areYouProfessional;
@synthesize valueOfJump;
@synthesize howYouRun;
@synthesize runningSpeed;

- (instancetype)init
{
    self = [super init];
    kindOfJump = @"I jump in length";
    areYouProfessional = @"I am a professional jumper in length";
    valueOfJump = arc4random_uniform(7) + (arc4random_uniform(2) * 0.1);
    howYouRun = @"I always run on my practice and when I accelerate for jump";
    runningSpeed = arc4random_uniform(13) + 6;
    return self;
}

#pragma mark -- @requred
- (void) intro {
    NSLog(@"Hi I am a %@.", self);
    [self jump];
    [self run];
}

- (void) jump {
    NSLog(@"%@: %@ %@ and my jump length is %f", self, areYouProfessional, kindOfJump, valueOfJump);
}

#pragma mark -- @optional
-(void) run {
    NSLog(@"%@ and my speed is %lu", howYouRun, (unsigned long)runningSpeed);
}

@end
