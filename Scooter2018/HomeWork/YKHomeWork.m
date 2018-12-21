//
//  YKHomeWork.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 14.03.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKHomeWork.h"
#import "YKHuman.h"
#import "YKBicyclist.h"
#import "YKRunner.h"
#import "YKSwimmer.h"
#import "YKDriver.h"
#import "YKAnimal.h"
#import "YKDog.h"
#import "YKHorse.h"
#import "YKBird.h"

#import <UIKit/UIKit.h>

@implementation YKHomeWork

+ (void) homeWork1V5 {
    YKHuman *human = [[YKHuman alloc] init];
    YKBicyclist *bicyclist = [[YKBicyclist alloc] init];
    YKRunner *runner = [[YKRunner alloc] init];
    YKSwimmer *swimmer = [[YKSwimmer alloc] init];
    YKHuman *human2 = [[YKHuman alloc] init];
    YKDriver *driver = [[YKDriver alloc] init];
    
    [human2 setName:@"Human2"];
    [human2 setHight:0.46];
    [human2 setWeight:3.23];
    [human2 setSex:@"female"];
       
    
    
//    NSArray *humans = @[human, bicyclist, runner, swimmer, driver, human2];
//    for (YKHuman *human in humans) {
//        if ([human isKindOfClass:[YKDriver class]]) {
//            NSLog(@"name - %@ // hight - %f // weight - %f // sex - %@ // age - %lu // driving experience - %lu", [human name], [human hight], [human weight], [human sex], (unsigned long)[driver age], (unsigned long)[driver drivingExperience]);
//            [human movement];
//            continue;
//        }
//
//        NSLog(@"name - %@ // hight - %f // weight - %f // sex - %@", [human name], [human hight], [human weight], [human sex]);
//        [human movement];
//    }
    
//    for (int i = [humans count] - 1; i >= 0 ; i--) {    //вывести в обратном направлнеии
//        YKHuman *human = [humans objectAtIndex:i];
//        if ([human isKindOfClass:[YKDriver class]]) {
//                    NSLog(@"name - %@ // hight - %f // weight - %f // sex - %@ // age - %lu // driving experience - %lu", [human name], [human hight], [human weight], [human sex], (unsigned long)[driver age], (unsigned long)[driver drivingExperience]);
//                    [human movement];
//                    continue;
//                }
//        NSLog(@"name - %@ // hight - %f // weight - %f // sex - %@", [human name], [human hight], [human weight], [human sex]);
//        [human movement];
//    }
    
//    ~~~~~~~~~~~~~~~~~~~~~~~~humans + Animals~~~~~~~~~~~~~~~~~~~~~~~MASTER
    YKAnimal *animal = [[YKAnimal alloc] init];
    YKDog *dog = [[YKDog alloc] init];
    YKHorse *horse = [[YKHorse alloc] init];
    YKBird *bird = [[YKBird alloc] init];
    
    NSArray *objects = @[human, bicyclist, runner, swimmer, driver, human2, animal, dog, horse, bird];
    
    for (id obj in objects) {
        if ([obj isMemberOfClass:[YKDriver class]]) {
            NSLog(@"%@", [obj class]);
            NSLog(@"name - %@ // hight - %f // weight - %f // sex - %@ // age - %lu // driving experience - %lu", [driver name], [driver hight], [driver weight], [driver sex], (unsigned long)[driver age], (unsigned long)[obj drivingExperience]);
            [obj movement];
            continue;
        }

        if ([obj isKindOfClass:[YKHuman class]]) {
            NSLog(@"%@", [obj self]);
            NSLog(@"name - %@ // hight - %f // weight - %f // sex - %@", [obj name], [obj hight], [obj weight],
                  [obj sex]);
            [obj movement];
            continue;
        }
        
        if ([obj isMemberOfClass:[YKBird class]]) {
            NSLog(@"%@", [obj class]);
            NSLog(@"%@ has %lu limbs, %@ and %lu wings", [obj name], (unsigned long)[obj limbs], [obj tail], (unsigned long)[obj wings]);
            [obj movement];
            continue;
        }
        
        NSLog(@"%@", [obj class]);
        NSLog(@"%@ has %lu limbs, %@", [obj name], (unsigned long)[obj limbs], [obj tail]);
        [obj movement];
    }
    
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~STAR~~~~~~~~~~~~~~~~~~~~~~~~~~");
    
    NSArray *humans = @[human, bicyclist, runner, swimmer, driver, human2];
    NSArray *animals = @[animal, dog, horse, bird];
    int count = 0;
    uint hCount = (unsigned int)[humans count] - 1;
    uint aCount = (unsigned int)[animals count] - 1;
    
    if ((int)(aCount - hCount) < 0 ) {
        count = hCount;
    } else {
        count = aCount;
    }
    
    NSLog(@"count %d", count);
    
    for (uint i = 0; i <= count; i++) {
        if (i <= hCount) {
            NSLog(@"%@", [humans objectAtIndex:i]);
        }
        
        if (aCount >= i) {
            if ([[animals objectAtIndex:i] isMemberOfClass:[YKBird class]]) {
                NSLog(@"%@", [[animals objectAtIndex:i] class]);
                NSLog(@"%@ has %lu limbs, %@ and %lu wings", [[animals objectAtIndex:i] name], (unsigned long)[[animals objectAtIndex:i] limbs], [[animals objectAtIndex:i] tail], (unsigned long)[[animals objectAtIndex:i] wings]);
                [[animals objectAtIndex:i] movement];
                continue;
            }
            
            NSLog(@"%@", [[animals objectAtIndex:i] class]);
            NSLog(@"%@ has %lu limbs, %@", [[animals objectAtIndex:i] name], (unsigned long)[[animals objectAtIndex:i] limbs], [[animals objectAtIndex:i] tail]);
            [[animals objectAtIndex:i] movement];
        }
    }
    
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~Супермен~~~~~~~~~~~~~~~~~~~~~~~~~~");
    NSArray *objects2Array = @[runner, horse, human, dog, bicyclist, bird, swimmer, driver, animal, human2];
    NSArray *sortedArray = [[NSArray alloc] init];
    
    NSSortDescriptor *sortName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
//    NSSortDescriptor *sortNikName = [NSSortDescriptor sortDescriptorWithKey:@"nikName" ascending:YES];
//    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortName, sortNikName, nil];
    sortedArray = [objects2Array sortedArrayUsingDescriptors:@[sortName]];
    NSMutableArray *sortedAnimals = [[NSMutableArray alloc] init];
    for (id sortObj in sortedArray) {
        if ([sortObj isKindOfClass:[YKAnimal class]]) {
            [sortedAnimals addObject:sortObj];
            continue;
        }
        
        NSLog(@"%@ - %@", [sortObj class], [sortObj name]);
    }
    NSLog(@"-------------------");
    for (YKAnimal *animal in sortedAnimals) {
        NSLog(@"%@ - %@", [animal class], [animal name]);
    }

}

@end
/*
 Итак домашнее задание по массивам, ну и заодно повторим все пройденное:
 
 Уровень ученик:
 (просто повторение того что увидел)
 
 1. Создать класс "человек", который будет содержать в себе базовые качества - "имя", "рост", "вес", "пол", а также будет иметь метод "передвижение".
 2. Создать дочерние классы (наследники) "велосипедист", "бегун", "пловец" и переопределить метод "передвижение" в каждом из этих классов.
 3. При старте программы создать по одному объекту каждого класса и объединить их в массив.
 4. В цикле пройти по всем элементам массива и вывести на экран все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "передвижение".
 
 Если получилось пройти уровень ученик, то можно попробовать уровень студент:
 (небольшая импровизация + дополнительная мозговая деятельность)
 
 5. Создать еще одного наследника от класса человек, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам человека
 6. Метод "передвижение" реализовать таким образом, чтобы перед тем как выполнить свое собственное передвижение, он выполнял передвижение реализованное в классе человек
 7. Массив выводить в обратном порядке.
 
 Уровень Мастер:
 (простор для фантазии + больше мозговой деятельности + больше практики)
 
 8. Создать класс "животное" (не наследник класса человек!) со своими собственными базовыми свойствами (отличными от человеческих) и методом "передвижение".
 9. Унаследоваться от него и создать пару других классов с переопределенным передвижением.
 10. Объединить всех людей и животных в один массив.
 11. В цикле выводить тип объекта (человек или животное) перед тем как выводить его свойства и вызывать метод
 
 Уровень Звезда:
 (разобраться с тем чего Леша не объяснял! + реальная задача!)
 
 12. Поместить всех людей в один массив, а животных в другой массив (количество людей и животных должно быть разное)
 13. В одном цикле выводить сначала человека а потом животное, доставая данные поочередно из двух разных массивов, если в одном из массивов объектов больше, то в конце должны выводиться только объекты этого массива (так как других уже нет)
 
 Уровень Супермен!
 (кодинг за гранью возможного! + вероятность успеха практически 0! + реальный вызов!)
 
 14. Соединить животных и людей в одном массиве.
 15. Используя нужный метод класса NSArray отсортировать массив (как результат будет другой массив).
 16. Сортировать так: сначала люди, а потом животные, люди отсортированы по имени, а животные по кличкам
 17. Реально требует разобраться с сортировкой самому, тяжело, но достойно уважения
 
 Код можете копировать сюда, если будет не красиво, то найдем лучший способ, может как документы прикреплять?
 
 Так же приветствуются обсуждение, взаимная помощь и вопросы
 */
