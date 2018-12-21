//
//  YKStudent.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 14.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKStudent.h"

@implementation YKStudent

- (instancetype)init
{
    self = [super init];
    _lastName = self.lastName;
    _name = self.name;
    _speech = self.speech;
    return self;
}

- (NSString *) description {//helloString {
    NSString *string = [NSString stringWithFormat: @"-- %@ -- %@ -- %@", self.speech, self.lastName, self.name];
    return string;
}

- (NSString *) fullName {
    NSString * fullName = [NSString stringWithFormat:@"%@ %@", self.lastName, self.name];
    return fullName;
}

- (NSString *) studentID {
    NSString *stringID = [self.lastName stringByAppendingString: self.name];
    return stringID;
}

@end
