//
//  YKHuman.m
//  Scooter1
//
//  Created by Egor on 21.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKHuman.h"

@interface YKHuman ()
//@property (nonatomic, retain) NSString    *name;

@end

@implementation YKHuman

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.age = 0;
        self.hight = 0;
        self.weight = 0;
        self.sex = @"man";
        self.name = @"no name";
    }
    return self;
}

- (void)dealloc
{
    self.name = nil;
}

- (void)movement {
    NSLog(@"Human - walk");
}

//- (NSString *)setTheName:(NSString *)name {
//    self.name = name;
//    return self.name;
//}

@end
