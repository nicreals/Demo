//
// Created by Nic on 2018/4/18.
// Copyright (c) 2018 UpChina. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()


@end

@implementation GCDViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"GCD";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testDispatchSetTarget];
//    [self testDispatchSync];
//    [self testDispatchBarrier];
//    [self testDispatchGroup];

}

- (void)testDispatchSetTarget {
    dispatch_queue_t queue1 = dispatch_queue_create("com.dispatch.serial1", NULL);
    dispatch_queue_t queue2 = dispatch_queue_create("com.dispatch.serial2", NULL);
    dispatch_queue_t queue3 = dispatch_queue_create("com.dispatch.serial3", NULL);
    dispatch_queue_t queue4 = dispatch_queue_create("com.dispatch.serial4", NULL);

    dispatch_set_target_queue(queue1, queue4);
    dispatch_set_target_queue(queue2, queue4);
    dispatch_set_target_queue(queue3, queue4);

    dispatch_async(queue1, ^{
        sleep(3);
        NSLog(@"queue1");
    });
    dispatch_async(queue2, ^{
        sleep(2);
        NSLog(@"queue2");
    });
    dispatch_async(queue3, ^{
        sleep(1);
        NSLog(@"queue3");
    });

    // 将多个serial queue指定同一个target queue(serial),那么这多个serial queue将是按顺序串行执行

}

- (void)testDispatchSync {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"async");

        dispatch_sync(queue, ^{
            NSLog(@"sync");
        });
        NSLog(@"sync done");

    });
    NSLog(@"done");

}

- (void)testDispatchBarrier {
    //创建一个并行队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.gcd.barrier.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_queue_t concurrentQueue1 = dispatch_queue_create("com.gcd.barrier.concurrentQueue1", DISPATCH_QUEUE_CONCURRENT);

    //并行操作
    void (^blk1)() = ^{
        NSLog(@"1");
    };
    void (^blk2)() = ^{
        NSLog(@"2");
    };
    void (^blk3)() = ^{
        NSLog(@"3");
    };
    void (^blk4)() = ^{
        NSLog(@"4");
    };
    void (^blk5)() = ^{
        NSLog(@"5");
    };
    void (^blk6)() = ^{
        NSLog(@"6");
    };

    //栅栏函数执行操作
    void (^barrierBlk)() = ^{
        NSLog(@"Barrier!");
    };

    //执行所有操作
    dispatch_async(concurrentQueue, blk1);
    dispatch_async(concurrentQueue, blk2);
    dispatch_async(concurrentQueue, blk3);
    dispatch_barrier_async(concurrentQueue1, barrierBlk);
    dispatch_async(concurrentQueue, blk4);
    dispatch_async(concurrentQueue, blk5);
    dispatch_async(concurrentQueue, blk6);

}

- (void)testDispatchGroup {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_t group = dispatch_group_create();

    dispatch_group_async(group, queue, ^{
        [self task1];
    });
    dispatch_group_async(group, queue, ^{
        [self task2];
    });
    dispatch_group_async(group, queue, ^{
        [self task3];
    });

    long result = dispatch_group_wait(group, 1);
    NSLog(@"<== result = %li ==>", result);

//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"done");
//    });

}

- (void)task1 {
    sleep(1);
    NSLog(@"task1");

}

- (void)task2 {
    sleep(2);
    NSLog(@"task2");

}

- (void)task3 {
    sleep(3);
    NSLog(@"task3");

}


@end