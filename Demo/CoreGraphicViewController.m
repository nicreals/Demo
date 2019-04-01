//
//  CoreGraphicViewController.m
//  Demo
//
//  Created by Nic on 2019/3/29.
//  Copyright © 2019 UpChina. All rights reserved.
//

#import "CoreGraphicViewController.h"

@interface CoreGraphicViewController ()

@end

@implementation CoreGraphicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 600)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:50 startAngle:M_PI_2 * 4.f / 5.f endAngle:M_PI_2 / 5.f * 6.f clockwise:NO];
    [path addLineToPoint:CGPointMake(30, 500)];
    [path addLineToPoint:CGPointMake(70, 500)];
    
    [path closePath];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    shape.frame = view.bounds;
    shape.fillColor = [UIColor redColor].CGColor;
    shape.path = path.CGPath;
    [view.layer addSublayer:shape];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
