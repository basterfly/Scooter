//
//  YKDoctor10.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 25.09.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKDoctor10.h"
#import "YKGovernment.h"
//#import "UIApplication.h"

@implementation YKDoctor10

#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryChangedNotification:)
                                                     name:YKGovernmentSalaryDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangeNotification:)
                                                     name:YKGovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(inflationChangedNotification:)
                                                     name:YKGovernmentInflationDidChangeNotification
                                                   object:nil];
        NSLog(@"Doctor : Looking for goSleepChangedEnterBackgroundNotification");
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackground2:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForeground:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        NSLog(@"Doctor : Still listening for goSleepChangedEnterBackgroundNotification");
    }
    
    return self;
}

#pragma mark - Dealloc
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"Now Doctor is Deallocate");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:(YKGovernmentSalaryDidChangeNotification) object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:(YKGovernmentAveragePriceDidChangeNotification) object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:(YKGovernmentInflationDidChangeNotification) object:nil];
}

#pragma mark - Notifications
- (void) salaryChangedNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentSalaryUserInfoKey];
    CGFloat salary = [value floatValue];
    if (salary < self.salary) {
        NSLog(@"Doctors are NOT Happy");
    } else {
        NSLog(@"Doctors are HAPPY");
    }
    
    _salaryIndex = self.salary / salary;
    self.salary = salary;
}

- (void) averagePriceChangeNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    if (_averagePrice == 0) {
        _averagePrice = averagePrice;
    }
    
    if (_averagePrice < averagePrice) {
        NSLog(@"Doctor: AveragePrice is growing UP!");
    } else NSLog(@"Doctor: AveragePrice is down grade");
    _indexOfPrices = (averagePrice / _averagePrice);
}

- (void) inflationChangedNotification:(NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:YKGovernmentInflationUserInfoKey];
    CGFloat inflation = [value floatValue];
//    if ((_averagePrice / value) > 1) {
//        NSLog(@"Inflation : %.2f %@", _inflation, @"%");
//    } else if ((_averagePrice / value) <= 1) {
//        NSLog(@"Inflation down: %.2f %@ ", _inflation, @"%");
//    }
    
    if (_indexOfPrices > _salaryIndex) {
    NSLog(@"Doctor: averagePrice Difference is %.2f > salaryIndex %.2f AND Inflation is %.2f %@ It's not OK!", _indexOfPrices, _salaryIndex, inflation, @"%");
    } else {
     NSLog(@"Doctor: averagePrice Difference is %.2f < salaryIndex %.2f AND Inflation is %.2f %@ But it's OK for now!",
           _indexOfPrices, _salaryIndex, inflation, @"%");
    }
}

- (void)applicationDidEnterBackground2:(NSNotification *)notification {
    NSLog(@"%@ Doctor: Sleeeeep Hhrrrrr", self.class);
}

- (void) applicationWillEnterForeground:(NSNotification *)notification {
    NSLog(@"%@ Doctor: woke Up", self.class);
}

@end
