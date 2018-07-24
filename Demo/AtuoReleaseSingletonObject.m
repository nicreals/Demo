//
//  AtuoReleaseSingletonObject.m
//  Demo
//
//  Created by Nic on 2018/7/23.
//  Copyright © 2018年 UpChina. All rights reserved.
//

#import "AtuoReleaseSingletonObject.h"

@implementation AtuoReleaseSingletonObject

+ (instancetype)sharedInstance {
    static __weak AtuoReleaseSingletonObject *_instance;
    AtuoReleaseSingletonObject *strongSingleton = _instance;
    @synchronized(self) {
        if (!strongSingleton) {
            strongSingleton = [[AtuoReleaseSingletonObject alloc] init];
            _instance = strongSingleton;
        }
    }
    return strongSingleton;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
