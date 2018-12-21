//
//  YKRunner7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 27.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKRunner7.h"

@implementation YKRunner7
@synthesize howYouRun;
@synthesize areYouProfessional;
@synthesize runningSpeed;
@synthesize runningDistance;

- (instancetype)init
{
    self = [super init];
    howYouRun = @"I run perfectly and agressive all time";
    areYouProfessional = @"I am a professional runner";
    runningSpeed = arc4random_uniform(20) + 5 + (arc4random_uniform(5) * 0.1);
    runningDistance = arc4random_uniform(20) + 5 + (arc4random_uniform(5) * 0.1);
    return self;
}


#pragma mark -- @required

- (void) intro {
    NSLog(@"HI I am %@", self);
    [self howYouRun];
    [self areYouProfessional];
    NSLog(@"My running speed is %lu km/hour and distance is %f", (unsigned long)runningSpeed, runningDistance);
}

- (void) run {
    NSLog(@"%@: - %@ %@ My running speed is %lu km/hour and distance is %f", self, howYouRun, areYouProfessional, runningSpeed, runningDistance);
}

@end
