//
//  YKDancer.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 09.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKDancer.h"

@implementation YKDancer

- (void) dance {
    
}

#pragma mark - YKPatient

- (BOOL) areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is Dancer %@ OK? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void) takePill {
    NSLog(@"Dancer %@ take a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Dancer %@ take make a shot", self.name);
}

@end
