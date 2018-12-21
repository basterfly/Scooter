//
//  YKStudent.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 09.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKStudent.h"

@implementation YKStudent

- (void) study {
    
}

#pragma mark - YKPatient @required

- (BOOL) areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is Student %@ OK? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void) takePill {
    NSLog(@"Student %@ take a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Student %@ take make a shot", self.name);
}

#pragma mark - YKPatient @optional

- (NSString *) howIsYourFamily {
    return @"My family is doing well!";
}

@end
