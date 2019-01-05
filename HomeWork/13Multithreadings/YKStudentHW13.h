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

- (void)guessValueDispatch:(NSUInteger)value inRange:(NSRange)range;

@end
