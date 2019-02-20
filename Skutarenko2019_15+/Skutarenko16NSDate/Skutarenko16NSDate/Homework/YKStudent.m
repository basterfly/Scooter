//
//  YKStudent.m
//  Skutarenko16NSDate
//
//  Created by Egor Kozlovskiy on 2/17/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "YKStudent.h"

@implementation YKStudent

- (NSString *)description{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    return [NSString stringWithFormat:@"Description: %@ - Age: %ld - DateOfBirth: %@", self.name, (long)self.age, [dateFormatter stringFromDate: self.dateOfBirth]];
}

@end
