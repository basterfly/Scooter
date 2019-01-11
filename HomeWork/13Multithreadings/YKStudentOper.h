//
//  YKStudentOper.h
//  13NSThreading
//
//  Created by Egor Kozlovskiy on 1/8/19.
//  Copyright © 2019 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YKStudentHW13;

@interface YKStudentOper : NSOperation
//@property (strong, nonatomic) YKStudentHW13 *student;
//@property (nonatomic, copy) void(^resultBlock)(void);

+ (NSOperationQueue *)staticOperationQueue;

- (instancetype)initWithStudent:(YKStudentHW13 *)student andResultBlock:(void(^)(void))resultBlock;

@end
