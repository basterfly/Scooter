//
//  YKSportsman.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 22.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKSportsman.h"

@implementation YKSportsman
@synthesize kindOfJump;
@synthesize areYouProfessional;
@synthesize valueJumpHight;
@synthesize valueJumpLength;
@synthesize howYouSwimm;
@synthesize swimmingDistance;
@synthesize howYouRun;
@synthesize runningSpeed;


- (instancetype)init
{
    self = [super init];
    kindOfJump = @"I jump in to length and jump in to high";
    areYouProfessional = @"I am not professional sportsman";
    valueJumpHight = arc4random_uniform(10) + (arc4random_uniform(9) * 0.1 );
    valueJumpLength = arc4random_uniform(14) + (arc4random_uniform(9) * 0.1 );
    howYouSwimm = @"I swimm just for train my body";
    swimmingDistance = arc4random_uniform(30) + 10;
    howYouRun = @"I just run 1 time in 2 days";
    runningSpeed = arc4random_uniform(15) + 5;
    return self;
}

#pragma mark -- @required methods
- (void) intro {
    NSLog(@"Hello, I am %@ - %@!", self, areYouProfessional);
    [self jump];
    [self swimm];
    [self run];
}

- (void) jump {
    NSLog(@"%@ with my results %f , %f !", kindOfJump, valueJumpLength, valueJumpHight);
}

#pragma mark -- @optional

- (void) swimm {
    NSLog(@"%@, my distance %f", howYouSwimm, swimmingDistance);
}

- (void) run {
    NSLog(@"%@ my speed is %d", howYouRun, (NSUInteger)runningSpeed);
}

@end
