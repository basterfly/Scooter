//
//  YKStudent.m
//  Skutarenko16NSDate
//
//  Created by Egor Kozlovskiy on 2/17/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "YKStudent.h"

@implementation YKStudent

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [self setName];
        self.lastName = [self setLastName];
    }
    return self;
}

- (NSString *)description{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    return [NSString stringWithFormat:@"Description: %@ %@ - Age: %ld - DateOfBirth: %@", self.name, self.lastName, (long)self.age, [dateFormatter stringFromDate: self.dateOfBirth]];
}

- (NSString *)setName{
    NSString *name = [NSString new];
    int lengthOfName = arc4random_uniform(5) + 3;
    for (int index = 1; index <= lengthOfName; index++) {
        char character;
        if (index == 1) {
            uint letter = arc4random_uniform(25) + 65;
            character = letter;
            name = [name stringByAppendingFormat:@"%c", character];
        } else {
            uint letter = arc4random_uniform(25) + 97;
            character = letter;
            name = [name stringByAppendingFormat:@"%c", character];
        }
    }
    
    return name;
}

- (NSString *)setLastName{
    NSString *lastName = [NSString new];
    int lengthOfName = arc4random_uniform(8) + 4;
    for (int index = 1; index <= lengthOfName; index++) {
        char character;
        if (index == 1) {
            uint letter = arc4random_uniform(25) + 65;
            character = letter;
            lastName = [lastName stringByAppendingFormat:@"%c", character];
        } else {
            uint letter = arc4random_uniform(25) + 97;
            character = letter;
            lastName = [lastName stringByAppendingFormat:@"%c", character];
        }
        
    }
    return lastName;
}


@end
