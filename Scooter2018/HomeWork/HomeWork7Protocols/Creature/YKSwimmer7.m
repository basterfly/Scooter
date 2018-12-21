//
//  YKSwimmer7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 27.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKSwimmer7.h"

@implementation YKSwimmer7
@synthesize howYouSwimm;
@synthesize areYouProfessional;
@synthesize swimmingDistance;
@synthesize diving;

- (instancetype)init
{
    self = [super init];
    howYouSwimm = @"I swimm in the pool every day on my training.";
    areYouProfessional = @"I am a professional swimmer.";
    swimmingDistance = arc4random_uniform(20) + (arc4random_uniform(5) * 0.1);
    diving = @"I am diving when I turn back in the pool.";
    return self;
}

- (void) intro {
    NSLog(@"Hi I am %@.", self);
    [self areYouProfessional];
    [self howYouSwimm];
    NSLog(@"My swimming distance is %g. And, -Yes. %@", swimmingDistance, diving);
}

#pragma mark -- required
- (void) swimm {
    [self intro];
    [self jump];
}

#pragma mark -- optional
- (void) jump {
    NSLog(@"%@: -I jump only on start when I diving in to a pool. And sometimes I jump with a rope for the training", self);
}

@end
