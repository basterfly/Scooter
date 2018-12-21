//
//  YKDeveloper.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 09.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKDeveloper.h"
#import "YKPatient.h"

@implementation YKDeveloper

-(void) work {
    
}

#pragma mark - YKPatient

- (BOOL) areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is developer %@ OK? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void) takePill {
    NSLog(@"Developer %@ take a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Developer %@ take make a shot", self.name);
}

#pragma mark - YKPatient @optional

- (NSString *) howIsYourJob {
    return @"My job is owesome!";
}

@end
