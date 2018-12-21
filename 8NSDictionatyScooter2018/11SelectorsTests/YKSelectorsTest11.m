//
//  YKSelectorsTest11.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 26.10.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKSelectorsTest11.h"
#import "YKObjectTest11.h"

@implementation YKSelectorsTest11

- (void) selectorsTests {
    
    SEL selector1 = @selector(testMethod);
    SEL selector2 = @selector(testMethod:);
    SEL selector3 = @selector(testMethod:parameter2:);
    
    YKObjectTest11 *objTest11 = [[YKObjectTest11 alloc] init];
    
    [self performSelector:@selector(testMethod)];
    [self performSelector:selector1];
    [self performSelector:selector2 withObject:@"test string"];
    [self performSelector:selector3 withObject:@"Object 1" withObject:@"object2"];
    
    [self performSelector:selector1 withObject:nil afterDelay:5.f]; //выводим с интервалом в 5 сек
    
    [objTest11 performSelector:@selector(testMethod)]; //вызовится у YKSelectorsTest11
    [objTest11 performSelector:selector1]; //вызовится у YKSelectorsTest11
    NSLog(@"%@", [objTest11 performSelector:@selector(superSecretText)]);
    
    [self performSelector:@selector(testMethodParameter1:) withObject:[NSNumber numberWithInteger:11]]; //значение intValue выведено не будет т.к. performSelector: настолько прост что не умеют извлекать значения примитивных типов из обьектов
    
    NSString *s = NSStringFromSelector (selector1); //из селекторов можно созавать строки и потом их хранить в массиве
    SEL selectorString = NSSelectorFromString(s); //селектор из строки
//    @property (assign, nonatomic) SEL sel; //селектор можно сделать и свойством
    
}

- (void) testMethod {
    NSLog(@"testMethod");
}

- (void) testMethod:(NSString *)string {
    NSLog(@"testMethod: %@", string);
}

- (void) testMethod:(NSString *)string parameter2:(NSString *)string2 {
    NSLog(@"testMethod: %@ parameter2: %@", string, string2);
}

- (void) testMethodParameter1:(NSInteger)intValue { //значение intValue выведено не будет т.к. performSelector: настолько прост что не умет работать с приметивными типами
    NSLog(@"testMethodParameter1 %ld", (long)intValue);
}

@end
