//
//  YKPatient.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 23.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YKPatient <NSObject>

@required
@property (strong, nonatomic) NSString* name;

- (BOOL) areYouOK;
- (void) takePill;
- (void) makeShot;

@optional
- (NSString *) howIsYourFamily;
- (NSString *) howIsYourJob;

@end
