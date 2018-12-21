//
//  YKStudent7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 23.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKStudent7.h"

@implementation YKStudent7

- (void) study {
    NSLog(@"Student must learn!");
}

#pragma mark - YKPatient
- (BOOL) areYouOK {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is Student %@ ok? %@ ", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void) takePill {
    NSLog(@"Student %@ takes a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Student %@ takes makes a shot", self.name);
}

- (NSString *) howIsYourFamily {
//    NSLog(@"%@: My family is ok!", self.name);
    return @"My family is ok!";
}
@end
