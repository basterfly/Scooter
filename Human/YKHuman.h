//
//  YKHuman.h
//  Scooter1
//
//  Created by Egor on 21.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKHuman : NSObject
@property (nonatomic, strong)   NSString    *name;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, assign)   CGFloat     hight;
@property (nonatomic, assign)   CGFloat     weight;
@property (nonatomic, strong)   NSString    *sex;

- (void)movement;
- (void)type;

@end
