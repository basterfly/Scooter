//
//  YKTestsString.m
//  Scooter14NSString
//
//  Created by Egor Kozlovskiy on 1/15/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "YKTestsString.h"

@implementation YKTestsString

- (void)StringTests {
    
    NSString *string1 = @"String1";
    NSString *string2 = @"String2";
    
    NSArray *strings = [NSArray arrayWithObjects:string1, string2, nil];
    for (NSString *str in strings) {
        if ([str isEqualToString:string2]) {
            NSLog(@"index = %lu", (unsigned long)[strings indexOfObject:str]); //ALL Objects will to compare or isEqual
            // and simple values we can compare like ==
        }
    }
    
    string1 = @"Hello, World!";
    NSLog(@"%@", string1);
    NSRange range = [string1 rangeOfString:@"World"];
    NSLog(@"range = %@", NSStringFromRange(range));
    //
    range = [string1 rangeOfString:@"world"];
    if (range.location != NSNotFound) {
        NSLog(@"range = %@", NSStringFromRange(range));
    } else {
        NSLog(@"not found");
    }
    
    //
    //    range = [string1 rangeOfString:@"world" options:NSCaseInsensitiveSearch];
    range = [string1 rangeOfString:@"world" options:NSCaseInsensitiveSearch | NSBackwardsSearch];
    if (range.location != NSNotFound) {
        NSLog(@"range = %@", NSStringFromRange(range));
    } else {
        NSLog(@"not found");
    }
    
    string2 = [string1 substringFromIndex:5];
    NSLog(@"%@", string2);
    string2 = [string1 substringToIndex:5];
    NSLog(@"%@", string2);
    string2 = [string1 substringWithRange:NSMakeRange (5, 7)];
    NSLog(@"%@", string2);
    
    //
    NSRange searchRange = NSMakeRange(0, [string1 length]);
    NSUInteger counter = 0;
    while (YES) {
        NSRange range = [string1 rangeOfString:@"l" options:0 range:searchRange];
        if (range.location != NSNotFound) {
            NSUInteger index = range.location + range.length;
            searchRange.location = index;
            searchRange.length = [string1 length] - index;
            NSLog(@"%@", NSStringFromRange(range));
            counter++;
        } else {
            break;
        }
    }
    
    NSLog(@"Counter = %lu", counter);
    
    //
    string2 = [string1 stringByReplacingOccurrencesOfString:@"l" withString:@"L"];
    NSLog(@"%@", string2);
    
    string2 = [string1 uppercaseString];
    NSLog(@"%@", string2);
    
    string2 = [string1 lowercaseString];
    NSLog(@"%@", string2);
    
    string2 = [string2 capitalizedString];
    NSLog(@"%@", string2);
    
    NSLog(@"%d", [@"512" intValue]);
    
    string2 = [string1 stringByReplacingOccurrencesOfString:@"," withString:@" "];
    string2 = [string2 stringByReplacingOccurrencesOfString:@"!" withString:@" "];
    NSLog(@"%@", string2);
    
    strings = [string1 componentsSeparatedByString:@" "];
    NSLog(@"componentsSeparatedByString %@", strings);
    
    string2 = [strings componentsJoinedByString:@"_"];
    NSLog(@"componentsJoinedByString %@", string2);
    
    // рассмотреть регулярные выражения!
    
    NSLog(@"%@", [string1 stringByAppendingString:string2]);
}

@end
