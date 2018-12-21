//
//  YKCarDriver.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 19.04.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    YKMale,
    YKFemale
} YKGender;

@interface YKCarDriver : NSObject
@property (assign, nonatomic) YKGender gender;
@property (assign, nonatomic) NSUInteger drivingAge;

+ (YKCarDriver *) birth;

- (void) driverInfo;

@end
