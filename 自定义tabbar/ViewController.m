//
//  ViewController.m
//  自定义tabbar
//
//  Created by nyl on 2018/10/15.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "ViewController.h"
#import "YLTabBarController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    [[UIApplication sharedApplication] delegate].window.rootViewController = [[YLTabBarController alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
