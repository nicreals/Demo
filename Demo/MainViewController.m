//
// Created by Nic on 2018/4/18.
// Copyright (c) 2018 UpChina. All rights reserved.
//

#import "MainViewController.h"
#import "GCDViewController.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MainViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Test";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

    self.dataArray = @[
            @{
                    @"name" : @"GCD"
            },

    ];
    [self.tableView reloadData];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:@"tableViewCell"];

    }
    NSDictionary *dictionary = self.dataArray[indexPath.row];
    NSString *name = dictionary[@"name"];
    tableViewCell.textLabel.text = name;

    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dictionary = self.dataArray[indexPath.row];
    NSString *name = dictionary[@"name"];
    if ([name isEqualToString:@"GCD"]) {
        GCDViewController *viewController = [[GCDViewController alloc] init];
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController
                                             animated:YES];

    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;

    }
    return _tableView;
}

@end