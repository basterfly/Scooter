//
//  YKFish7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 27.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKFish7.h"

@implementation YKFish7
@synthesize howYouSwimm;
@synthesize areYouProfessional;
@synthesize diving;

- (instancetype)init
{
    self = [super init];
    howYouSwimm = @"It is a fish, it swim all time.";
    areYouProfessional = @"Fish does not have a profession and it is not a sportsman but it professional swimmer :)";
    diving = @"Fish it is a diver, because it is always under the water.";
    return self;
}

#pragma mark -- @required
- (void) intro {
    NSLog(@"%@ %@ %@", howYouSwimm, areYouProfessional, diving);
}

- (void) swimm {
    [self intro];
}

@end
