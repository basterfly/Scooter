//
//  YKStudentOper.m
//  13NSThreading
//
//  Created by Egor Kozlovskiy on 1/8/19.
//  Copyright © 2019 Egor Kozlovskiy. All rights reserved.
//

#import "YKStudentOper.h"
#import "YKStudentHW13.h"

static NSOperationQueue *YKstaticOperationQueue;

@interface YKStudentOper()
@property (strong, nonatomic) YKStudentHW13 *student;
@property (nonatomic, copy) void(^resultBlock)(void);

@end

@implementation YKStudentOper

+ (NSOperationQueue *)staticOperationQueue {
    YKstaticOperationQueue = nil;
    @synchronized (self) {
        YKstaticOperationQueue = [[NSOperationQueue alloc] init];
    }
    
    return YKstaticOperationQueue;
}

- (instancetype)initWithStudent:(YKStudentHW13 *)student andResultBlock:(void(^)(void))resultBlock
{
    self = [super init];
    if (self) {
        self.student = student;
        self.resultBlock = resultBlock;
    }
    
    return self;
}

- (void)main {
    if ([self isCancelled]) {
        return;
    }
    
    @autoreleasepool {
        self.resultBlock();
    }
}

@end
