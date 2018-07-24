//
//  SingletonObject.h
//  Demo
//
//  Created by Nic on 2018/7/23.
//  Copyright © 2018年 UpChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonObject : NSObject

+ (instancetype)sharedInstance;

+ (void)destoryInstance;

@end
