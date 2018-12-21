//
//  YKHomeWork7.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 30.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKHomeWork7.h"
#import "YKSportsman.h"
#import "YKLazyman.h"
#import "YKJumper7.h"
#import "YKSwimmer7.h"
#import "YKRunner7.h"
#import "YKKangaroo.h"
#import "YKFish7.h"
#import "YKPuma7.h"

@implementation YKHomeWork7

+ (void) homeWork7 {
    YKSportsman *sportsman1 = [[YKSportsman alloc] init];
    YKLazyman *lazyMan1 = [[YKLazyman alloc] init];
    YKJumper7 *jumper1 = [[YKJumper7 alloc] init];
    YKSwimmer7 *swimmer1 = [[YKSwimmer7 alloc] init];
    YKRunner7 *runner1 = [[YKRunner7 alloc] init];
    YKKangaroo *kangaroo1 =[[YKKangaroo alloc] init];
    YKFish7 *fish1 = [[YKFish7 alloc] init];
    YKPuma7 *puma1 = [[YKPuma7 alloc] init];
    
    
    NSArray *creatures = @[sportsman1, lazyMan1, jumper1, swimmer1, runner1, kangaroo1, fish1, puma1];
    NSLog(@"V.1: Introducing himself every creature by method Intro \n");
    for (id creature in creatures) {
        [creature intro];
        NSLog(@"\n");
    }
    
    NSLog(@"V.2: Intoducing himself by answering to protocols methods \n");
    for (id creature in creatures) {
        if ([creature conformsToProtocol:@protocol (YKJumpers)]) {
            NSLog(@"%@: - ", [creature self]);
            [creature jump];
            if ([creature respondsToSelector:@selector(valueOfJump)]) {
                NSLog(@"RESPONDS TO SELECTOR VALUEOFJUMP = %f", [creature valueOfJump]);
            }
        }
        
        if ([creature conformsToProtocol:@protocol (YKSwimmers)]) {
            NSLog(@"%@: - ", [creature self]);
            [creature swimm];
            if ([creature respondsToSelector:@selector(swimmingDistance)]) {
                NSLog(@"RESPONDS TO SELECTOR SWIMMINGdISTANCE = %f", [creature swimmingDistance]);
            }
            
            if ([creature respondsToSelector:@selector(diving)]) {
                NSLog(@"RESPONDS TO SELECTOR DIVING = %@", [creature diving]);
            }
        }
        
        if ([creature conformsToProtocol:@protocol (YKRunners)]) {
            NSLog(@"%@: - ", [creature self]);
            [creature run];
            if ([creature respondsToSelector:@selector(runningDistance)]) {
                NSLog(@"RESPONDS TO SELECTOR RUNNINGDISTANCE = %f", [creature runningDistance]);
            }
        }
        
        if (![creature conformsToProtocol:@protocol (YKJumpers)] && ![creature conformsToProtocol:@protocol (YKSwimmers)]
            && ![creature conformsToProtocol:@protocol (YKRunners)]) {
            NSLog(@"~~~~~~ NOT Conforms!!! ~~~~~~");
            NSLog(@"%@: - ", [creature self]);
            [creature intro];
        }
    }
}

@end

/*
 1. Реализуйте протоколы Jumpers, Swimmers, Runners. Каждый протокол должен иметь пару свойств, например скорость или максимальная высота прыжка и пару методов, например прыгать или плыть, нырять и тд. Включите фантазию!!!
 
 2. Часть методов делайте обязательными (например у пловцов обязательный метод это плыть а у бегунов - бежать, логично?), а другую часть не обязательными.
 
 3. Используйте классы из задания про массивы, там где у вас люди и животные. Например у кенгуру и у особых спортсменов реализуйте протокол Jumpers, тоже самое с другими протоколами. Пусть каждый протокол будет реализован как некоторыми классами животных, так и некоторыми классами людей.
 
 4. Положите всех в одни массив. Тех кто прыгает заставьте прыгать и рассказывать про свои свойства. Причем у некоторых объектов пусть будут одни необязательные свойства или методы, а у других другие. Тот кто бегает пусть бегает, а тот кто плавает, пусть плавает. Тот кто ничего не делает должен быть выведен на экран как лодырь :)
 
 5. Сделайте так чтобы один какой-то класс мог и бегать и прыгать и плавать и посмотрите как он себя поведет в цикле.
 */
