//
//  YKObject.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 28.02.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKObject.h"

@implementation YKObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Object is created");
    }
    return self;
}

- (void) dealloc {
    NSLog(@"object is deallocated");
}

- (id) copyWithZone:(NSZone *)zone {
    return [[YKObject alloc] init]; //v.1! v.2 if my object has a some property i must create newObject and copy new object with its property!!! VIDEO 4 34 minute
}

@end
