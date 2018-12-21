//
//  YKHuman.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YKHuman : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat hight;
@property (assign, nonatomic) CGFloat weight;
@property (assign, nonatomic) NSString *sex;

- (void) movement;

@end
