//
//  YKCarDriver.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 19.04.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKCarDriver.h"

@implementation YKCarDriver

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gender = arc4random_uniform(2);
        self.drivingAge = arc4random_uniform(50);
    }
    return self;
}

+ (YKCarDriver *) birth {
    YKCarDriver *driver = [[YKCarDriver alloc] init];
    return driver;
}

- (void) driverInfo {
//    [(NSString*)stringWithEnum:gender];
//    NSLog(@"Driver gender - %@, Driving Age - %d ", [YKCarDriver genderToString: self.gender], self.drivingAge); //v.1
    NSLog(@"Driver gender - %@, Driving Age - %d ", [self genderToString], self.drivingAge); //v.2
}

//+ (NSString *) genderToString: (YKGender) gender {         v.1
//    NSString *string = gender ? @"Female" : @"Male";
//    return string;
//}

- (NSString *) genderToString {                          //v.2
    NSString *string = self.gender ? @"Female" : @"Male";
    return string;
}

@end
