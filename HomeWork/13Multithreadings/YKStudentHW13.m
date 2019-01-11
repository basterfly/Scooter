//
//  YKStudentHW13.m
//  13NSThreading
//
//  Created by Egor Kozlovskiy on 11.12.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKStudentHW13.h"
#import "YKStudentOper.h"

@implementation YKStudentHW13

- (void)operationGuessTheValue:(NSUInteger)value inRange:(NSRange)range {
    void(^resultBlock)(void) = ^{
        @autoreleasepool {
            NSUInteger location = range.location;
            NSUInteger iterations = 0;
            //    угадывать число и подсчитывать с какого раза угадал
            for (; location <= range.length; ) {
                iterations++;
                if (location < value) {
                    location = arc4random_uniform((uint32_t)range.length);
                }
                
                if (location > value) {
                    location = arc4random_uniform((uint32_t)location);
                }
                
                if (location == value) {
                    NSLog(@"I am %@ have guess the value on %lu times! The value is %lu", self.name, iterations, location);
                    break;
                }
            }
        }
        
        NSLog(@"%@: Goodbye!", self.name);
    };
    
    [[YKStudentOper staticOperationQueue] addOperation:[[YKStudentOper alloc] initWithStudent:self andResultBlock:resultBlock]]; //[YKStudentHW13 staticOperationQueue]; - ? does not work
}

@end
