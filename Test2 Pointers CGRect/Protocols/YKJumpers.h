//
//  YKJumpers.h
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YKJumpers <NSObject>

@property (nonatomic, strong) NSString *name;

- (void) jump;

@optional
@property (nonatomic, assign) NSUInteger hightOfJump;
@property (nonatomic, assign) NSUInteger lengthOfJump;

- (void)jumpUp;
- (void)jumpLong;

@end
