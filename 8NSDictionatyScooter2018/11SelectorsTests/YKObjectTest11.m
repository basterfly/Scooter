//
//  YKObjectTest11.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 26.10.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKObjectTest11.h"

@implementation YKObjectTest11

- (void) testMethod {
    NSLog(@"YKObjectTest11");
}

- (NSString *)superSecretText { //скрытый метод, но если знать его название то его можно вызвать через селектор
    return @"I have stolen your candy";
}

@end
