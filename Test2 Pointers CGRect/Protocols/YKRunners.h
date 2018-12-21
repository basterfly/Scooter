//
//  YKRunners.h
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YKRunners <NSObject>

- (void)run;

@optional
@property (nonatomic, assign) NSUInteger runningDistance;
@property (nonatomic, assign) NSUInteger runningTime;

- (void)proRunning;

@end
