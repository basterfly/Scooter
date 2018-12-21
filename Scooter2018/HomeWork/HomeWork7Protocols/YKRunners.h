//
//  YKRunners.h
//  Scooter2018
//
//  Created by Egor on 07.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YKRunners <NSObject>

@required
@property (strong, nonatomic) NSString *howYouRun;
@property (strong, nonatomic) NSString *areYouProfessional;
@property (assign, nonatomic) NSUInteger runningSpeed;

- (void) intro;
- (void) run;

//Just runner! no more else!
@optional
@property (assign, nonatomic) CGFloat runningDistance;

//- (void) swimm;
- (void) jump;

@end
