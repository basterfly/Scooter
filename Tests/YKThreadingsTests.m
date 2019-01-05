//
//  YKThreadingsTests.m
//  13NSThreading
//
//  Created by Egor Kozlovskiy on 09.12.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKThreadingsTests.h"
#import <UIKit/UIKit.h>

@interface YKThreadingsTests()
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *array;
@end

@implementation YKThreadingsTests

- (void)treadingsTests {
    
//    [self performSelectorInBackground:@selector(testThread) withObject:nil]; //- вызовет в бекграунде и при этом прожение загрузится пока будет идти подсчет
    
//    [[NSThread currentThread] isMainThread];
    for (int i = 0; i < 50; i++) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread) object:nil];
        self.name = [NSString stringWithFormat:@"Tread #%d", i + i];
        [thread start];
    }
    
    /////////////////
//    v.1 пробуем обращаться с двух разных потоков к проперти массиву
//    вариант плохой т.к. возможно обращение сразу обоих потоков к одной ячейке памяти что вызовет ошибки памяти
//    v.2 нужно делать замок чтобы защитить проперти
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"X"];
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"0"];
    thread1.name = @"Thread1";
    thread2.name = @"Thread2";
    [thread1 start];
    [thread2 start];
    
    self.array = [NSMutableArray array];
    [self performSelector:@selector(printArray) withObject:nil afterDelay:5];
    
    ///////////////////////////////
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        for (int i = 0; i < 2000; i++) {
        }
        
        dispatch_async(dispatch_get_main_queue(),^{ //если что то считал и нужно обновить на экране, выполняется через главный поток
            NSLog(@"%@ finish in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        });
    });
    
    ///////////////////////////////
    //    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); -выполняю на глобальной очереди два потока (оба блока на глобальной очереди вызываются одновременно) с X и 0 если бы в методе addStringToArray не было бы @sinchronized то посыпались бы ошыбки памяти а X и 0 будут в перемешку, в данном случае @sinchronized спасает, но если мы хотим избежать глобальной очереди и использовать свою собственную и еще и без @sinchronized то:
    dispatch_queue_t newQueue = dispatch_queue_create("com.ykkozlovskyi.testthreads.queue", DISPATCH_QUEUE_SERIAL);
    __weak id weakSelf = self;  //перестраховка на то что обьект не останется жить после смерти блока
    dispatch_async(newQueue, ^{
        [weakSelf addStringToArrayWithoutSinchronized:@"x"];
    });
    
    dispatch_async(newQueue, ^{
        [weakSelf addStringToArrayWithoutSinchronized:@"0"];
    });
//    результат последовательный вызов блока крестиков а после блок ноликов
//    следом можно вызвать основной поток на глобальной очереди, все выполнятся в порядке очереди
    dispatch_async(queue, ^{
//  UI Refresh      <#code#>
    });
}

- (void)testThread {
    @autoreleasepool {
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        for (int i = 0; i < 2000; i++) {
//            <#statements#>
        }
        
        NSLog(@"%@ finish in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
//        [self performSelectorOnMainThread:self withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>];    //если хотим что то вывести на главный экран, то нужно вызывать на главном потоке, есть не удобства с тем что можно передать 1 обьект, поэтому нужно организовывать NSDictionary и подавать по одному обьекту.
    }
}

///////////////////////////
//- (void)addStringToArray:(NSString *)string { //версия первая без @sychronize
//    @autoreleasepool {
//        double startTime = CACurrentMediaTime();
//        NSLog(@"%@ started", [[NSThread currentThread] name]);
//        for (int i = 0; i < 200000; i++) {
//            [self.array addObject:string];
//        }
//
//        NSLog(@"%@ finish in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
//    }
//}

- (void)addStringToArray:(NSString *)string { //весия вторая с @sychronized
    @autoreleasepool {
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        @synchronized(self) {
            NSLog(@"%@ calculations started", [[NSThread currentThread] name]);
            for (int i = 0; i < 2000; i++) {
                [self.array addObject:string];
            }
            
            NSLog(@"%@ calculations ended", [[NSThread currentThread] name]);
        }
        
        NSLog(@"%@ finish in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
}

- (void)addStringToArrayWithoutSinchronized:(NSString *)string {
    @autoreleasepool {
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started", [[NSThread currentThread] name]);
//        @synchronized(self) {
            NSLog(@"%@ calculations started", [[NSThread currentThread] name]);
            for (int i = 0; i < 2000; i++) {
                [self.array addObject:string];
            }
            
            NSLog(@"%@ calculations ended", [[NSThread currentThread] name]);
//        }
        
        NSLog(@"%@ finish in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
}

- (void)printArray {
    NSLog(@"%@", self.array);
}

@end
