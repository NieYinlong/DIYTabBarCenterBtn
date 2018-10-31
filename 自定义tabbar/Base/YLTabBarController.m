//
//  YLTabBarController.m
//  自定义tabbar
//
//  Created by nyl on 2018/10/15.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "YLTabBarController.h"
#import "YLTabBar.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"


@interface YLTabBarController ()<YLTabBarDelegate>

@property (nonatomic, strong) YLTabBar *ylTabBar;


@end

@implementation YLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI{
    [self setupVC];
    [[UITabBar appearance] setShadowImage:[UIImage new]];

    //kvo形式添加自定义的 UITabBar
    [self setValue:self.ylTabBar forKey:@"tabBar"];
}

- (YLTabBar *)ylTabBar {
    if (!_ylTabBar) {
        _ylTabBar = [YLTabBar instanceCustomTabBarWithType:kTbaBarItemUIType_Five];
        //_ylTabBar.centerBtnTitle = @"发布";
        _ylTabBar.centerBtnIcon = @"centerIcon";
        _ylTabBar.tabDelegate = self;
    }
    return _ylTabBar;
}


- (void)setupVC{
    [self addChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"TabMessage" selectedImage:@"TabMessage_HL"];
    [self addChildVc:[[HomeViewController alloc] init] title:@"发现" image:@"TabMessage" selectedImage:@"TabMessage_HL"];
     [self addChildVc:[[HomeViewController alloc] init] title:@"发现" image:@"TabMessage" selectedImage:@"TabMessage_HL"];
     [self addChildVc:[[HomeViewController alloc] init] title:@"发现" image:@"TabMessage" selectedImage:@"TabMessage_HL"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    // 为子控制器包装导航控制器
    BaseNavigationController *navigationVc = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
}

-(void)tabBar:(YLTabBar *)tabBar clickCenterButton:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了中间按钮" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //self.tabBar.centerBtnTitle = @"选中了了";
        self.ylTabBar.centerBtnIcon = @"centerIcon_gray";
        
        CGFloat left = (UIScreen.mainScreen.bounds.size.width - 70) / 2;
        UIView *aV = [[UIView alloc] initWithFrame:CGRectMake(left, UIScreen.mainScreen.bounds.size.height - 34- 44, 70, 70)];
        aV.backgroundColor = [UIColor redColor];
        [self.view addSubview:aV];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
