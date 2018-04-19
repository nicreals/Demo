//
// Created by Nic on 2018/4/19.
// Copyright (c) 2018 UpChina. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()


@end

@implementation BasicViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Basic";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testFor];


}

- (void)testFor {
    NSInteger index = 100;
    for(;;) {
        index --;
        NSLog(@"<== index = %li ==>", index);
        if (index <= 0) {
            break;

        }
    }

}

@end