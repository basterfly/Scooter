//
//  YKGovernment.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.09.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKGovernment.h"

NSString* const YKGovernmentTaxLevelDidChangeNotification = @"YKGovernmentTaxLevelDidChangeNotification";
NSString* const YKGovernmentSalaryDidChangeNotification = @"YKGovernmentSalaryDidChangeNotification";
NSString* const YKGovernmentPensionDidChangeNotification = @"YKGovernmentPensionDidChangeNotification";
NSString* const YKGovernmentAveragePriceDidChangeNotification = @"YKGovernmentAveragePriceDidChangeNotification";
NSString* const YKGovernmentInflationDidChangeNotification = @"YKGovernmentInflationDidChangeNotification"; //HomeWork

NSString* const YKGovernmentTaxLevelUserInfoKey = @"YKGovernmentTaxLevelUserInfoKey";
NSString* const YKGovernmentSalaryUserInfoKey = @"YKGovernmentSalaryUserInfoKey";
NSString* const YKGovernmentPensionUserInfoKey = @"YKGovernmentPensionUserInfoKey";
NSString* const YKGovernmentAveragePriceUserInfoKey = @"YKGovernmentAveragePriceUserInfoKey";
NSString* const YKGovernmentInflationUserInfoKey = @"YKGovernmentInflationUserInfoKey"; //HomeWork
//CGFloat const YKGovermentPreviousAveragePrice = 0;

@implementation YKGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel = 5.f;
        self.salary = 1000;
        self.pension = 500;
        self.averagePrice = 10.f;
//        self.inflation = 0; //HomeWork // inflation depends on the averagePrice
    }
    return self;
}

- (void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel]
                                                           forKey: YKGovernmentTaxLevelUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:YKGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setSalary:(CGFloat)salary {
    _salary = salary;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary]
                                                           forKey:YKGovernmentSalaryUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:YKGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension {
    _pension = pension;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension]
                                                           forKey:YKGovernmentPensionUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:YKGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setAveragePrice:(CGFloat)averagePrice {
    CGFloat previousAveragePrice;
    if (_averagePrice == 0) {
        previousAveragePrice = _averagePrice = averagePrice;
    } else {
        previousAveragePrice = _averagePrice;
        _averagePrice = averagePrice;
    }
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice]
                                                           forKey:YKGovernmentAveragePriceUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:YKGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    [self setInflation: previousAveragePrice]; //HomeWork
    
}

- (void) setInflation:(CGFloat)value { //процентный рост средней цены на товар //HomeWork
    _inflation = ((_averagePrice - value) / value) * 100;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:_inflation]
                                                           forKey:YKGovernmentInflationUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:YKGovernmentInflationDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    NSLog(@"Inflation set : %.2f %@",_inflation, @"%");
}
@end
