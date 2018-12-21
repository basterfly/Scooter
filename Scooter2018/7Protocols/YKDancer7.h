//
//  YKDancer7.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 23.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKPatient.h"

@interface YKDancer7 : NSObject <YKPatient>

@property (strong, nonatomic) NSString *favouriteDance;
@property (strong, nonatomic) NSString *name;

- (void) dance;

@end
