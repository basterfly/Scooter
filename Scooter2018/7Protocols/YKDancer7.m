//
//  YKDancer7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 23.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKDancer7.h"

@implementation YKDancer7

- (void) dance {
    NSLog(@"Dancer can dance!");
}

#pragma mark - YKPatient
- (BOOL) areYouOK {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is dancer %@ ok? %@ ", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void) takePill {
    NSLog(@"dancer %@ takes a pill", self.name);
}

- (void) makeShot {
    NSLog(@"dancer %@ takes makes a shot", self.name);
}

@end
