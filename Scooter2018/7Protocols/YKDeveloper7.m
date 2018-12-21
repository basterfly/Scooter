//
//  YKDeveloper7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 23.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKDeveloper7.h"

@implementation YKDeveloper7

- (void) work {
    NSLog(@"Developer write a code!");
}

#pragma mark - YKPatient
- (BOOL) areYouOK {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is developer %@ ok? %@ ", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void) takePill {
    NSLog(@"Developer %@ takes a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Developer %@ takes makes a shot", self.name);
}

- (NSString *) howIsYourJob {
    //NSLog(@"%@:  My job is awesome!", self.name);
    return @"My job is awesome!";
}
@end
