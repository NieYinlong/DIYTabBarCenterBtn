//
//  YLTabBar.h
//  自定义tabbar
//
//  Created by nyl on 2018/10/15.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
//tab页面个数
typedef NS_ENUM(NSInteger, kTbaBarItemUIType) {
    kTbaBarItemUIType_Three = 3,//底部3个选项
    kTbaBarItemUIType_Five = 5,//底部5个选项
};

@class YLTabBar;

@protocol YLTabBarDelegate <NSObject>

-(void)tabBar:(YLTabBar *)tabBar clickCenterButton:(UIButton *)sender;

@end


@interface YLTabBar : UITabBar

@property (nonatomic, weak) id<YLTabBarDelegate> tabDelegate;
@property (nonatomic, strong) NSString *centerBtnTitle;
@property (nonatomic, strong) NSString *centerBtnIcon;

+ (instancetype)instanceCustomTabBarWithType:(kTbaBarItemUIType)type;

@end
