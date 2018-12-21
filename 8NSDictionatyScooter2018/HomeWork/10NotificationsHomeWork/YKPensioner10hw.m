//
//  YKPensioner10hw.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.10.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKPensioner10hw.h"
#import "YKGovernment.h"

@implementation YKPensioner10hw

#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(pensionChengedNotification:)
                                                     name:YKGovernmentPensionDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:YKGovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(inflationChangedNotification:)
                                                     name:YKGovernmentInflationDidChangeNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - dealloc
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification
- (void) pensionChengedNotification: (NSNotification *)notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentPensionUserInfoKey];
    CGFloat pension = [value floatValue];
    if (pension < self.pension) {
        NSLog(@"%f WTF", pension);
    }
    if (pension == self.pension) {
        NSLog(@"%f Hhmmm pension is same!", pension);
    } else NSLog(@"%f pension is bigger!", pension);
    NSLog(@"pensionChengedNotification - %@", self);
}

- (void) averagePriceChangedNotification:(NSNotification *)notification {
    NSNumber *tempItem = [notification.userInfo valueForKey:YKGovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [tempItem floatValue];
    if (_averagePrice < averagePrice) {
        NSLog(@"Pensioner: Oh no! averagePrice is growing up!");
    }
    else NSLog(@"Pensioner: averagePrice still OK");
}

- (void) inflationChangedNotification:(NSNotification *)notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentInflationUserInfoKey];
    CGFloat inflation = [value floatValue];
    NSLog(@"Pensioner: My pension still without changes, but inflation all time grow up! Oh my god ");
}
@end
