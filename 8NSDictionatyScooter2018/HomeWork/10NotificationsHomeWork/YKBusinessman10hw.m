//
//  YKBusinessman10hw.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.10.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKBusinessman10hw.h"
#import "YKGovernment.h"

@implementation YKBusinessman10hw

#pragma mark - Init
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(taxLevelChangedNotification:)
                                                     name:YKGovernmentTaxLevelDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:YKGovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(inflationChangedNotification:)
                                                     name:YKGovernmentInflationDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackgroundNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForegroundNotification:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - Dealloc
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:YKGovernmentAveragePriceDidChangeNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:YKGovernmentTaxLevelDidChangeNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications
- (void) taxLevelChangedNotification:(NSNotification *)notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentTaxLevelUserInfoKey];
    CGFloat taxLevel = [value floatValue];
    NSLog(@"notification: taxLevelChangedNotification - %@ \n self.taxLevel was = %f and NOW taxLevel is = %f ",
          self, self.taxLevel, taxLevel);
    self.taxLevel = taxLevel;
}

- (void) averagePriceChangedNotification:(NSNotification *)notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    if (_averagePrice == 0) {
        _averagePrice = averagePrice;
    }
    if (_averagePrice < averagePrice) {
        NSLog(@"Businessman: Its not good! Prices are UP!");
    } else NSLog(@"Businessman: AveragePrice is slow down!");
    _averagePriceIndex = averagePrice / _averagePrice;
}

- (void) inflationChangedNotification:(NSNotification *)notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentInflationUserInfoKey];
    CGFloat inflation = [value floatValue];
    CGFloat differenceAveragePrice = ((_averagePrice * _averagePriceIndex) - _averagePrice);
    differenceAveragePrice = differenceAveragePrice * 0.945; //- tax 5.5%
    CGFloat biggerPrice = (((inflation / 100) + 1) * differenceAveragePrice) * ((100 + 5.5) / 100);
    NSLog(@"I must roll up costs of my products on (differenceAveragePrice * inflation) + tax = %.2f With %.2f - inflation.", biggerPrice, inflation);
}

- (void) applicationDidEnterBackgroundNotification:(NSNotification *)notification {
    NSLog(@"%@ Businessman Goes to slep", self.class);
}

- (void)applicationWillEnterForegroundNotification:(NSNotification *)notification {
    NSLog(@"%@ Businessman Woke Up", self.class);
}
@end
