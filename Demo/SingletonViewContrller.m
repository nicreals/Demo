//
//  SingletonViewContrller.m
//  Demo
//
//  Created by Nic on 2018/7/23.
//  Copyright © 2018年 UpChina. All rights reserved.
//

#import "SingletonViewContrller.h"
#import "SingletonViewContrller.h"
#import "SingletonObject.h"
#import "AtuoReleaseSingletonObject.h"

@interface SingletonViewContrller ()

@property (nonatomic, strong) UIButton *createButton;
@property (nonatomic, strong) UIButton *destoryButton;
@property (nonatomic, strong) SingletonObject *singleton;

@end

@implementation SingletonViewContrller

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
        [button setTitle:@"create singleton" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(createSingleton) forControlEvents:UIControlEventTouchUpInside];
        self.createButton = button;
        [self.view addSubview:button];
    }
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 150, 30)];
        [button setTitle:@"destory singleton" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(destorySingleton) forControlEvents:UIControlEventTouchUpInside];
        self.createButton = button;
        [self.view addSubview:button];
    }
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 150, 30)];
        [button setTitle:@"auto singleton" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(autoSingleton) forControlEvents:UIControlEventTouchUpInside];
        self.createButton = button;
        [self.view addSubview:button];
    }
    self.singleton = [SingletonObject sharedInstance];
//    AtuoReleaseSingletonObject *sin = [AtuoReleaseSingletonObject sharedInstance];
}

- (void)createSingleton {
    [SingletonObject sharedInstance];
}

- (void)destorySingleton {
    [SingletonObject destoryInstance];
}

- (void)autoSingleton {
    AtuoReleaseSingletonObject *objectA = [AtuoReleaseSingletonObject sharedInstance];
    AtuoReleaseSingletonObject *objectB = [AtuoReleaseSingletonObject sharedInstance];
}

- (void)dealloc {
    NSLog(@"dealloc");
}



@end
