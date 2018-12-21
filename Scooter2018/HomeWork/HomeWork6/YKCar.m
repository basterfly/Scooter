//
//  YKCar.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 18.04.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKCar.h"

@implementation YKCar
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transmition = arc4random_uniform(4);
        self.status = arc4random_uniform(2);
    }
    return self;
}

+ (YKCar *) rentCar {
    YKCar *car = [[YKCar alloc] init];
    return car;
}

- (void) carStatus {
//    NSLog(@"Car Status - %@, Transmition - %u", [YKCar carStatusToString: self.status], (YKCarTransmition)self.transmition);
    NSLog(@"Car Status - %@, Transmition - %@", [YKCar carStatusToString: self.status], [self carTransmitionToString]);
}

+ (NSString *)carStatusToString: (YKCarStatus) status { //обратить внимание что этот метод сделан через метод класса,
    NSString *string = status ? @"New" : @"Used";   // в отличии от следующего
    return string;
}

- (NSString *) carTransmitionToString { //а вся разница в том что можно не пересылать входное значение,
    NSString *string;                   //т.к. они все в одной области видимости
    if(self.transmition == 3) {         //
        string = @"Variator";           //так же можно было использовать switch а не if - else
        return string;
    }
    
    if(self.transmition == 2) {
        string = @"Robot";
        return string;
    }
    
    if(self.transmition == 1) {
        string = @"Automat";
        return string;
    }
    
    else string = @"Manual";
    return string;
}

@end
