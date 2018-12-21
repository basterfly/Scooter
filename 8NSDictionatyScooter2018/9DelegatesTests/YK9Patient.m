//
//  YK9Patient.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YK9Patient.h"

@implementation YK9Patient

- (BOOL) howAreYou {
    BOOL iFeelGood = arc4random() % 2;
    NSLog(@"%@: %@", self.name, iFeelGood ? @"YES" : @"NO");
    if (!iFeelGood) {
        [self.delegate patientFeelsBad: self];
    }
    
    return iFeelGood;
}

- (void) takePill {
    NSLog(@"%@ takes a pill.", self.name);
}

- (void) makeShot {
    NSLog(@"%@ make a shot.", self.name);
}

@end
