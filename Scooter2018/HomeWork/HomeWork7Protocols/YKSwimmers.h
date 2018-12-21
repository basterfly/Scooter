//
//  YKSwimmers.h
//  Scooter2018
//
//  Created by Egor on 07.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YKSwimmers <NSObject>

@required
@property (strong, nonatomic) NSString *howYouSwimm;
@property (strong, nonatomic) NSString *areYouProfessional;

- (void) intro;
- (void) swimm;

@optional
@property (assign, nonatomic) CGFloat swimmingDistance;
@property (strong, nonatomic) NSString *diving;

- (void) jump;
- (void) run;

@end
