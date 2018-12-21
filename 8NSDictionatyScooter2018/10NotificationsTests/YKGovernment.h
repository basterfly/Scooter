//
//  YKGovernment.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.09.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString* const YKGovernmentTaxLevelDidChangeNotification;
extern NSString* const YKGovernmentSalaryDidChangeNotification;
extern NSString* const YKGovernmentPensionDidChangeNotification;
extern NSString* const YKGovernmentAveragePriceDidChangeNotification;
extern NSString* const YKGovernmentInflationDidChangeNotification; //HomeWork

extern NSString* const YKGovernmentTaxLevelUserInfoKey;
extern NSString* const YKGovernmentSalaryUserInfoKey;
extern NSString* const YKGovernmentPensionUserInfoKey;
extern NSString* const YKGovernmentAveragePriceUserInfoKey;
extern NSString* const YKGovernmentInflationUserInfoKey; //HomeWork
//CGFloat const YKGovermentPreviousAveragePrice;

@interface YKGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat inflation;

@end

/*
 Задание:
 
 Ученик.
 
 1. Используя мой код создать свой проект со своими классами и понять как оно работает
 2. Добавить классы "пенсионер" и "бизнесмен"
 3. Доктор следит за изменением зарплаты, бизнесмен должен следить за изменением налогов, а пенсионер за изменением пенсий.
 4. Все классы: Доктор, Пенсионер и Бизнесмен долджны следить также и за средней ценой на товар.
 
 Умничка.
 
 5. Каждый из классов следит за инфляцией (процентный рост средней цены на товар) и оценивает свой потенциальный доход по отношению к инфляции, например размер пенсии к возможности купить продукты у пенсионера, либо новая прибыль за вычетом налогов у бизнесмена также по отношению к ценам на товар.
 
 6. Не секрет что изменение этих характеристик оказывает разное влияние на разные слои населения, поэтому пусть в зависимости от уровня покупательской способности каждый класс выдает свои перлы.
 
 Мастер.
 
 7. Подпишите классы на нотификацию ухода приложения в бекграунд, чтобы когда нажимается кнопка HOME и приложение сворачивается, каждый объект заявлял о том что он идет спать
 
 8. Тоже самое сделать для случая, когда приложение возвращается из свернутого состояния
 
 Супермен
 
 9. Создайте свой класс аналог апп делегату, только он не делегат приложения, но слушатель тех же самых нотификаций, какие методы есть у делегата. Грубо говоря у вашего класса должны быть теже методы, что и у апп делегата, но вызываться они должны путем нотификаций
 
 10. Добавьте НСЛоги в каждый метод апп делегата и своего класса
 
 11. Сворачивая и разварачивая приложение добивайтесь вызовов определенный методов делегата и тех же нотификаций и посмотрите что вызывается раньше - метод делегата или нотификация :)
 */
