//
//  SingletonObject.m
//  Demo
//
//  Created by Nic on 2018/7/23.
//  Copyright © 2018年 UpChina. All rights reserved.
//

#import "SingletonObject.h"

@implementation SingletonObject

// MARK： - SharedInstance

static SingletonObject *_instance = nil;
static dispatch_once_t onceTokenshare;
+ (instancetype)sharedInstance {
    dispatch_once(&onceTokenshare, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

static dispatch_once_t onceTokeninit;
- (instancetype)init {
    dispatch_once(&onceTokeninit, ^{
        _instance = [super init];
    });
    return _instance;
}

+ (void)destoryInstance {
    _instance = nil;
    onceTokeninit = 0;
    onceTokenshare = 0;
}

- (void)dealloc {
    NSLog(@"dealloc");
}


@end
