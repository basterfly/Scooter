//
//  YKPatient.h
//  Test2 Pointers CGRect
//
//  Created by Egor on 10.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YKPatient <NSObject>

@required
@property (strong, nonatomic) NSString *name;

@required
- (BOOL) areYouOk;
- (void) takePill;
- (void) makeShot;

@optional
- (NSString *) howIsYourFamily;
- (NSString *) howIsYourJob;
@end
