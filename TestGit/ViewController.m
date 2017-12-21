//
//  ViewController.m
//  TestGit
//
//  Created by zhu on 2017/12/20.
//  Copyright © 2017年 na. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIView *)testView {
    if (_testView == nil) {
        _testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _testView.backgroundColor = [UIColor grayColor];
    }
    return _testView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
