//
//  YKStudentHW13.h
//  13NSThreading
//
//  Created by Egor Kozlovskiy on 11.12.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKStudentHW13 : NSObject
@property (strong, nonatomic) NSString *name;

- (void)guessValue:(NSUInteger)value inRange:(NSRange)range;
- (void)guessTheAnswer:(NSUInteger)value inRange:(NSRange )range;
//pupil
- (void)guessValueDispatch:(NSUInteger)value inRange:(NSRange)range;
//student
- (void)guessValueDispatch:(NSUInteger)value inRange:(NSRange)range withBlock:block;    //(void(^)(void))block;

@end
