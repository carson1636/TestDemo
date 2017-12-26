//
//  ViewController.m
//  TestGit
//
//  Created by zhu on 2017/12/20.
//  Copyright © 2017年 na. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSInteger leftTime;
@property (nonatomic, strong) NSTimer *timer;

@end

struct test {
    int i;
};

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.testView];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 36; i ++) {
        @autoreleasepool {
            NSString *imageName = [NSString stringWithFormat:@"refreshHeader_pig%d@2x.png", i];
            //                UIImage *image = [UIImage imageNamed:imageName];
            NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
            UIImage *image = [UIImage imageWithContentsOfFile:path];
            [images addObject:image];
        }
    }
    self.imageView.animationImages = images;
    self.imageView.animationDuration = 1.0f;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.bounds.size.width-100)/2.0f, 400, 100, 50);
    [btn setTitle:@"进入购物车" forState: UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.leftTime = 10;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (self.leftTime != 0) {
            NSString *time = [NSString stringWithFormat:@"%zd:%zd", self.leftTime/60, self.leftTime%60];
            self.navigationController.tabBarItem.title = time;
            self.leftTime --;
            
        } else {
            [self.timer invalidate];
            self.timer = nil;
            self.leftTime = 10;
            self.navigationController.tabBarItem.title = @"购物车";
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
#if 0
    NSMutableArray *images = [[NSMutableArray alloc] init];
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i <= 36; i ++) {
            @autoreleasepool {
                NSString *imageName = [NSString stringWithFormat:@"refreshHeader_pig%d@2x.png", i];
//                UIImage *image = [UIImage imageNamed:imageName];
                NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
                UIImage *image = [UIImage imageWithContentsOfFile:path];
                [images addObject:image];
            }
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.imageView.animationImages = images;
        self.imageView.animationDuration = 1.0f;
        [self.imageView startAnimating];
    });
#endif
    [self.imageView startAnimating];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.imageView stopAnimating];
}

- (void)dealloc {
    DLog(@"对象销毁");
}

- (void)btnDidClicked {
    UIViewController *newView = [UIViewController new];
    newView.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:newView animated:YES];
}

- (UIView *)testView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
