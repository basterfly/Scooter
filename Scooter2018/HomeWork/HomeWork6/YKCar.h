//
//  YKCar.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 18.04.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    YKTransmitionManual,
    YKTransmitionAutomat,
    YKTransmitionRobot,
    YKTransmitionVariator
} YKCarTransmition;

typedef enum {
    YKCarUsed,
    YKCarNew
} YKCarStatus;

@interface YKCar : NSObject
@property (assign, nonatomic) YKCarTransmition transmition;
@property (assign, nonatomic) YKCarStatus status;

+ (YKCar *) rentCar;

- (void) carStatus;

@end
