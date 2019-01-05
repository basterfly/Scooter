//
//  YKMultithreadingsHW13.m
//  13NSThreading
//
//  Created by Egor Kozlovskiy on 11.12.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKMultithreadingsHW13.h"
#import "YKStudentHW13.h"

static dispatch_queue_t YKstaticQueue;
static dispatch_once_t once;

@implementation YKMultithreadingsHW13

-(void)multithreadingsHW {
    NSMutableArray *students = [[NSMutableArray alloc] init];
    for (NSUInteger index = 1; index <= 5; index++) {
        YKStudentHW13 *student = [[YKStudentHW13 alloc] init];
        student.name = [NSString stringWithFormat: @"Student_%lu", (unsigned long)index ];
        [students addObject:student];
    }
    
    for (YKStudentHW13 *student in students) {
        NSRange range = NSMakeRange((arc4random_uniform(20)), (arc4random_uniform(120)));
        if (range.location > range.length) {
            NSUInteger temp = range.location;
            range.location = range.length;
            range.length = temp;
        }
        
        uint32_t guessValue = (arc4random_uniform((uint32_t)range.length ));
        if (guessValue < range.location) {
            for (; guessValue < range.location; ) {
                guessValue = (arc4random_uniform((uint32_t)range.length ));
            }
        }
        
        NSLog(@"%@ will have to guess %u in range: %lu - %lu", student.name, guessValue, range.location, range.length);
//без потока
//        [student guessTheAnswer:guessValue inRange:range];
//NSThread
//        [student guessValue:guessValue inRange:range];
//dispatch_queue_t
//        [student guessValueDispatch:guessValue inRange:range];

//        student
//        __weak YKStudentHW13 *weakStudent = student;
        void(^mainBlock)(void) = ^(void) {
//      dispatch_queue_t with block on main thread
            NSLog(@"%@ did guess value %u in range %lu - %lu", student.name, guessValue, (unsigned long)range.location, range.length);
        };
        [student guessValueDispatch:guessValue inRange:range withBlock:mainBlock];
//        dispatch_queue_t mainQueue = dispatch_get_main_queue(); //no need
//        dispatch_async(dispatch_get_main_queue(), mainBlock); // execute from student obj
    }
}

/*//      Master
-(void)multithreadingsHWMaster {
    NSLog(@"~~~Master~~~ +(dispatch_queue_t)initAndReturnStaticQueue ~~~");
    NSMutableArray *students = [[NSMutableArray alloc] init];
    for (NSUInteger index = 1; index <= 5; index++) {
        YKStudentHW13 *student = [[YKStudentHW13 alloc] init];
        student.name = [NSString stringWithFormat: @"Student_%lu", (unsigned long)index ];
        [students addObject:student];
    }
    
    for (YKStudentHW13 *student in students) {
        NSRange range = NSMakeRange((arc4random_uniform(20)), (arc4random_uniform(120)));
        if (range.location > range.length) {
            NSUInteger temp = range.location;
            range.location = range.length;
            range.length = temp;
        }
        
        uint32_t guessValue = (arc4random_uniform((uint32_t)range.length ));
        if (guessValue < range.location) {
            for (; guessValue < range.location; ) {
                guessValue = (arc4random_uniform((uint32_t)range.length ));
            }
        }
        
//      Master
//        dispatch_async(YKstaticQueue, ^{
        dispatch_async([[self class] initAndReturnStaticQueue], ^{
            NSLog(@"%@ will have to guess %u in range: %lu - %lu", student.name, guessValue, range.location, range.length);
            [student guessValueDispatch:guessValue inRange:range];
        });
    }
}

//      Master
+(dispatch_queue_t)initAndReturnStaticQueue {
////   void(^blockForOnceStart)(void) = ^{
////        YKstaticQueue = dispatch_queue_create("com.YKStaticQueue", DISPATCH_QUEUE_CONCURRENT);
////    };
    
    dispatch_once(&once, ^(void){  
        YKstaticQueue = dispatch_queue_create("com.YKStaticQueue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return YKstaticQueue;
}
*/
@end

/*
 
 Супермен.
 13. Добавьте еще один класс студента, который делает все тоже самое что вы реализовали до этого, только вместо GCD он использует NSOperation и NSOperationQueue. Вообще вынос мозга в самостоятельной работе :)
 */
