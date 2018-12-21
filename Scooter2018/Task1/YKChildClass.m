//
//  YKChildClass.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 24.02.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKChildClass.h"

@implementation YKChildClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of child class is initialized");
    }
    return self;
}

- (NSString *) saySomeString {
    return [NSString stringWithFormat:@"%@", [super saySomething]]; //SUPER - вызов у родителя
}

- (NSString *) saySomething {
    return @"Something";
}

@end
