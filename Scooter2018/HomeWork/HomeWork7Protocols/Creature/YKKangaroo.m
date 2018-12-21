//
//  YKKangaroo.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 27.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKKangaroo.h"

@implementation YKKangaroo
@synthesize kindOfJump;
@synthesize areYouProfessional;

- (instancetype)init
{
    self = [super init];
    kindOfJump = @"Just junp on it legs.";
    areYouProfessional = @"It is a Kangaroo, not a sportsman. But it can be very high to jump.";
    return self;
}

#pragma mark -- @required
- (void) intro {
    NSLog(@"%@ %@", areYouProfessional, kindOfJump);
}

- (void) jump {
    [self intro];
}

@end
