//
//  NSDictionaryTests.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 14.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "NSDictionaryTests.h"

@implementation NSDictionaryTests
+ (void) tests {
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"Petrov", @"lastname",
                                @"Vasiliy", @"name",
                                [NSNumber numberWithInt:25], @"age",
                                nil];
    NSLog(@"%@", dictionary);
    
    NSLog(@"name = %@, lastname = %@, age = %d",
          [dictionary objectForKey:@"name"],
          [dictionary objectForKey:@"lastname"],
          [[dictionary objectForKey:@"age"] integerValue]);
    
    //    NSDictionary *dictionaryTest = [NSDictionary dictionaryWithObjectsAndKeys:<#(nonnull id), ...#>, nil];
    
    //    NSDictionary *dictionary2 = @{@"lastname":@"Ivanov", @"name":@"Ivan", @"age":[NSNumber numberWithInt:30]}; //NSNumber to @30->
    //    NSDictionary *dictionary2 = @{@"lastname":@"Ivanov", @"name":@"Ivan", @"age":@30};
    NSInteger number = 30;
    NSDictionary *dictionary2 = @{@"lastname":@"Ivanov", @"name":@"Ivan", @"age":@(number)};
    
    NSLog(@"%@", dictionary2);
    
    NSLog(@"name = %@, lastname = %@, age = %ld",
          [dictionary2 objectForKey:@"name"],
          [dictionary2 objectForKey:@"lastname"],
          [[dictionary2 objectForKey:@"age"] integerValue]);
    
    NSLog(@"%@, \n count = %d", dictionary2, [dictionary2 count]);
    
    for (NSDictionary *key in [dictionary2 allKeys]) {
        id obj = [dictionary2 objectForKey:key];
        NSLog(@"key - %@, obj - %@.",key, obj);
    }
}
@end
