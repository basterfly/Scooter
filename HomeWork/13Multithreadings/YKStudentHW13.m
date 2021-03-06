//
//  YKStudentHW13.m
//  13NSThreading
//
//  Created by Egor Kozlovskiy on 11.12.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKStudentHW13.h"

@implementation YKStudentHW13

//pupil
- (void)guessTheAnswer:(NSUInteger)value inRange:(NSRange )range {
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
            NSLog(@"I %@ have guess the value on %lu times! The value is %lu", self.name, iterations, location);
            break;
        }
    }
    
    NSLog(@"%@: Goodbye!", self.name);
}

//NSThread
- (void)guessValue:(NSUInteger)value inRange:(NSRange)range {
//    void(^myBlock)(NSUInteger, NSRange) = ^(NSUInteger value, NSRange range) {
    void(^myBlock)(void) = ^{
        @autoreleasepool {
            @synchronized(self) {
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
                        NSLog(@"I %@ have guess the value on %lu times! The value is %lu", self.name, iterations, location);
                        break;
                    }
                }
            }
        }
        
        NSLog(@"%@: Goodbye!", self.name);
    };
    
    NSThread *studentThread = [[NSThread alloc] initWithBlock:myBlock];
    studentThread.name = [NSString stringWithFormat:@"Thread_%@", self.name];
    [studentThread start];
}

//      Dispatch
- (void)guessValueDispatch:(NSUInteger)value inRange:(NSRange)range {
    void(^myBlock)(void) = ^{
        @autoreleasepool {
//            @synchronized(self) {
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
                        NSLog(@"I %@ have guess the value on %lu times! The value is %lu", self.name, iterations, location);
                        break;
                    }
                }
//            }
        }
    
        NSLog(@"%@: Goodbye!", self.name);
    };
    
    dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(myQueue, myBlock);
//    NSLog(@"%@: Goodbye!", self.name);
    
}

//      Dispatch with Block         Student
- (void)guessValueDispatch:(NSUInteger)value inRange:(NSRange)range withBlock:(id)mainBlock{
    void(^myBlock)(void) = ^{
        @autoreleasepool {
            @synchronized(self) {
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
                        NSLog(@"I %@ have guess the value on %lu times! The value is %lu", self.name, iterations, location);
                        break;
                    }
                }
            }
        }
        
        NSLog(@"%@: Goodbye!", self.name);
    };
    
    dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(myQueue, myBlock);
//    dispatch_async(mainQueue, mainBlock);
}

//- (void)guessValueDispatch:(NSUInteger)value inRange:(NSRange)range withBlock:(void (^)(void))block {
//}


@end
