//
//  YKParentClass.h
//  Scooter2018
//
//  Created by Egor on 16.01.18.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKParentClass : NSObject

+ (void) whoAreYou;

- (void) hello;
- (void) say:(NSString*)string;
- (void) say:(NSString*)string and:(NSString*)string2;
- (void) say:(NSString*)string and:(NSString*)string2 andAfterThat:(NSString*) string3;
- (NSString*) saySomething;

@end
