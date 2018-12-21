//
//  YKJumpers.h
//  Scooter2018
//
//  Created by Egor on 07.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YKJumpers <NSObject>

@required
@property (strong, nonatomic) NSString *kindOfJump;
@property (strong, nonatomic) NSString *areYouProfessional;

- (void) intro;
- (void) jump;

@optional
@property (assign, nonatomic) CGFloat valueOfJump;

- (void) swimm;
- (void) run;

@end
