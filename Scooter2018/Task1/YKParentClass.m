//
//  YKParentClass.m
//  Scooter2018
//
//  Created by Egor on 16.01.18.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKParentClass.h"

@implementation YKParentClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of parent class is initialized");
    }
    return self;
}

+ (void) whoAreYou {
    NSLog(@"I am %@", self);
}

- (void) hello {
    NSLog(@"%@ Parent says: Hello!", self);
}

- (void) say:(NSString *) string {
    NSLog(@"%@", string);
}

- (void) say:(NSString *) string and:(NSString*) string2 {
    NSLog(@"%@, %@",string, string2);
}

- (void) say:(NSString *)string and:(NSString*)string2 andAfterThat:(NSString*) string3 {
    NSLog(@"%@, %@, %@", string, string2, string3);
}

- (NSString *) saySomeNumberString {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (NSString *) saySomething {
//    return @"I wan`t say anything :)";
    // v.2
    NSLog(@"I wan`t say anything :)");
    return [self saySomeNumberString];
}

@end
