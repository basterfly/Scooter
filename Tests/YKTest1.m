//
//  YKTest1.m
//  Scooter1
//
//  Created by Egor on 04.08.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKTest1.h"

#import "YKHuman.h"
#import "YKRunner.h"
#import "YKBiker.h"
#import "YKSwimmer.h"
#import "YKBusinessman.h"

#import "YKAnimal.h"
#import "YKDog.h"
#import "YKKangaroo.h"
#import "YKBear.h"

@implementation YKTest1

+ (void)test1 {
        
    YKHuman *human = [[YKHuman alloc] init];
//        [human setTheName: @"Human1"];
    human.name = @"Human1";
    human.age = 15;
    human.hight = 1.6f;
    human.weight = 45;
    human.sex = YKMale;
        
    YKRunner *runner = [[YKRunner alloc] init];
    runner.name = @"runner";
    runner.age = 35;
    runner.hight = 1.8f;
    runner.weight = 55;
    runner.sex = YKFemale;
        
    YKBiker *biker = [[YKBiker alloc] init];
    biker.name = @"biker";
    biker.age = 28;
    biker.hight = 1.85f;
    biker.weight = 65;
    biker.sex = YKMale;
        
    YKSwimmer *swimmer = [[YKSwimmer alloc] init];
    swimmer.name = @"swimmer";
    swimmer.age = 25;
    swimmer.hight = 1.7f;
    swimmer.weight = 48;
    swimmer.sex = YKFemale;
        
    YKBusinessman *businessman = [[YKBusinessman alloc] init];
    businessman.name = @"Businessman";
    businessman.age = 45;
    businessman.hight = 178;
    businessman.weight = 90;
    businessman.sex = YKMale;
    businessman.allTimeBusy = @"all Time Busy";
    businessman.smallSleepingTime = @"small sleeping time";
//        businessman.earlyWakeup = @"earlyWakeup"; //?? не могу задать от сюда т.к. оно скрытое
    
    YKDog *dog = [[YKDog alloc] init];
    YKKangaroo *kangaroo = [[YKKangaroo alloc] init];
    YKBear *bear = [[YKBear alloc] init];
        
    NSArray *creatures = @[human, runner, biker, swimmer, businessman]; //v.1
    NSArray *animals = [NSArray arrayWithObjects: dog, kangaroo, bear, nil]; //v.2
    for (NSUInteger i = 0; i < creatures.count || i < animals.count; i++) {
        YKHuman *someone = [[YKHuman alloc] init];
        someone = [creatures objectAtIndex:i];
        if (i <= creatures.count ) {
            NSLog(@"%@: I am: %@ %lu, %f, %f, %@", someone, someone.name, (unsigned long)someone.age,
                    someone.hight, someone.weight, (someone.sex ? @"male" : @"female"));
            if ([someone isKindOfClass:[YKBusinessman class]]) {
                NSLog(@"%@, %@", businessman.allTimeBusy, businessman.smallSleepingTime); //why businessman???? if not only him??
                }
                
                [someone movement];
            }
            
            if (i <= animals.count - 1) {
                YKAnimal *animal = [[YKAnimal alloc] init];
                animal = [animals objectAtIndex:i];
                if (animal) {
                    [animal type];
                }
                
                [animal movement];
            }
        }
        
        //        Superman
        creatures = [creatures arrayByAddingObjectsFromArray:animals];
        NSLog(@"%lu", creatures.count); //test count
        NSArray *sortedArray = [[NSArray alloc] init];
        //        [object.name compare: nextObject.name]; // see: compare!!!
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        sortedArray = [creatures sortedArrayUsingDescriptors:@[sortDescriptor]];
        NSLog(@"~~~~~~~~~~~~~~~~~sort~~~~~~~~~~~~~~~~~");
        NSMutableArray *mutableAnimals = [[NSMutableArray alloc] init];
        for (YKHuman *object in sortedArray) {
            if ([object isKindOfClass:[YKAnimal class]]) {
                [mutableAnimals addObject:object];
                continue;
            }
            
            NSLog(@"%@", object.name);
        }
    
        for (YKAnimal *obj in mutableAnimals) {
            NSLog(@"%@", obj.name);
        }
}

@end
