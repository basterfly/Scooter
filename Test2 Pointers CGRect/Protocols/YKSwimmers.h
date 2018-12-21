//
//  YKSwimmers.h
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YKSwimmers <NSObject>

@property (nonatomic, strong) NSString *name;

- (void)swim;

@optional
@property (nonatomic, assign) NSUInteger swimmingDistance;
@property (nonatomic, assign) NSUInteger swimmingTime;

- (void)proSwimming;

@end
