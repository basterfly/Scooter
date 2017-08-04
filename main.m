//
//  main.m
//  Scooter1
//
//  Created by Egor on 21.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YKHuman.h"
#import "YKRunner.h"
#import "YKBiker.h"
#import "YKSwimmer.h"
#import "YKBusinessman.h"

#import "YKAnimal.h"
#import "YKDog.h"
#import "YKKangaroo.h"
#import "YKBear.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
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
    
    return 0;
}

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
 
 ///////////////////
 
 1. Я очень хочу чтобы вы попрактиковались создавать и использовать enum списки. Они ОЧЕНЬ распространены, они делают код красивее и вносят дополнительную информацию. Это просто очень хорошая практика их использовать! Практикуйтесь! Создайте кучу разных пропертей под разные энумы. Постарайтесь усвоить это сразу.
 
 2. Надо попрактиковаться со структурами. Например такое небольшое задание:
 на поле 10х10 рандомно создайте точек (разберитесь как рандомно генерировать цифры, подсказка - функция arc4random()) и проверяйте какая из точек попадает в квадрат размером 3х3 в самом центре поля. Грубо говоря надо определить какие из точек в массиве попадают в центр и вывести их на печать. Пробуйте и задавайте вопросы.
 
 3. Разберитесь с оболочками NSNumber и NSValue. На самом деле тут все предельно просто, но вы должны понять саму суть.
 
 Это все, жду вопросов и обсуждения!
*/
