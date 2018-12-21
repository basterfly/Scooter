//
//  YKHomeWork6.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 18.04.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKHomeWork6.h"
#import "YKCar.h"
#import "YKCarDriver.h"

@implementation YKHomeWork6
+ (void) homeWork6 {
    NSMutableArray *drivers = [[NSMutableArray alloc] init];
    NSMutableArray *cars = [[NSMutableArray alloc] init];
    
    YKCarDriver *driver1 = [[YKCarDriver alloc] init];
    [drivers addObject:driver1];
//    [driver1 init];
    for (int iter = 0; iter < 2; iter++) {
        [drivers addObject:[[YKCarDriver alloc] init]];
        [drivers addObject:[YKCarDriver birth]];
    }
    
    NSUInteger driversCount = [drivers count];
    
    for (NSUInteger iter = driversCount; iter > 0; iter--) {
        [cars addObject:[YKCar rentCar]];
    }
    
//    [cars addObject:[YKCar rentCar]];
//    [cars addObject:[YKCar rentCar]];
    NSLog(@"%lu - drivers",(unsigned long)[drivers count]); //%d
    NSLog(@"%lu - cars",(unsigned long)[cars count]); //%d
    
    for (YKCarDriver *driver in drivers) {
        NSLog(@"Driver is %@ ", [driver self]);
        [driver driverInfo];
    }
    
    for (YKCar *car in cars) {
        [car self];
        [car carStatus];
    }
    
//    ~~~Pointers Rects Size~~~
    NSLog(@"\n~~~Pointers Rects Size~~~\n ");
    
    CGRect rect = CGRectMake (0, 0, 10, 10);
    NSValue *rectValue = [NSValue valueWithCGRect:rect];    //обернул что бы мог вывести на экран
    NSLog(@"Rect = %@", rectValue);
    NSMutableArray *pointers = [[NSMutableArray alloc] init];
    
    CGRect rectCenter = CGRectMake(3.5, 3.5, 3, 3);
    NSValue *rectCenterValue = [NSValue valueWithCGRect:rectCenter];    //обернул что бы мог вывести на экран
    NSLog(@"Rect Center = %@", rectCenterValue);
    
    for (NSUInteger iter = 0; iter < 5; iter++) {
        CGPoint point = CGPointMake((arc4random_uniform(11) + ((CGFloat)arc4random_uniform(10) / 10)),
                                    (arc4random_uniform(11) + ((CGFloat)arc4random_uniform(10) / 10)));
        NSValue *value = [NSValue valueWithCGPoint:point];
        [pointers addObject:value];
    }
    
    for (NSValue *value in pointers) {
        NSLog(@"point - %@", value);
        CGPoint point = [value CGPointValue];   //достаем значение из обертки value
        BOOL result = CGRectContainsPoint(rectCenter, point);   //проверяем попадает в центральный квадрат или нет
        NSLog(@"Rect Center contains point? - %@", (result ? @"Yes" : @"No"));
    }
}

@end
