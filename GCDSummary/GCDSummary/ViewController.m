//
//  ViewController.m
//  GCDSummary
//
//  Created by jinghua on 16/11/1.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self asyncConcurrent];
//    [self asyncSerial];
//    [self syncConcurrent];
//    [self syncSerial];
//    [self asyncMain];
//    [self syncMain];
}

//同步执行 + 主队列
- (void)syncMain {
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"---start----");
    dispatch_sync(queue, ^{
        NSLog(@"任务1----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3----%@",[NSThread currentThread]);
    });
    NSLog(@"---end----");
}
//异步执行 + 主队列
- (void)asyncMain {
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"---start---");
    dispatch_async(queue, ^{
        NSLog(@"任务1---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3---%@",[NSThread currentThread]);
    });
    NSLog(@"---end---");
}
//同步执行 + 串行队列
- (void)syncSerial {
    dispatch_queue_t queue = dispatch_queue_create("id4", DISPATCH_QUEUE_SERIAL);
    NSLog(@"---start----");
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"---end----");
}
//同步执行 + 并行队列
- (void)syncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create("id3", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
}
//异步执行 + 串行队列
- (void)asyncSerial {
    dispatch_queue_t queue = dispatch_queue_create("id2", DISPATCH_QUEUE_SERIAL);
    NSLog(@"----start----");
    dispatch_async(queue, ^{
        NSLog(@"任务1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3----%@",[NSThread currentThread]);
    });
    NSLog(@"----end----");
}
//并行队列 + 异步线程
- (void)asyncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create("id", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"----start----");
    dispatch_async(queue, ^{
        NSLog(@"任务1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3----%@",[NSThread currentThread]);
    });
    NSLog(@"----end-----");
}

@end
