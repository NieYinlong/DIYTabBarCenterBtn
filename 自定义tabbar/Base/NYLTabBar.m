//
//  NYLTabBar.m
//  自定义tabbar
//
//  Created by nyl on 2018/10/29.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "NYLTabBar.h"

#define kIsiPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//iPhoneX底部危险区域高度
#define kDangerAreaHeight 34


@implementation NYLTabBar


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.centerBtn];
    }
    return self;
}

- (UIButton *)centerBtn {
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_centerBtn setBackgroundImage:[UIImage imageNamed:@"centerIcon"] forState:(UIControlStateNormal)];
    }
    return _centerBtn;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSMutableDictionary *tabBarButtonDic = [NSMutableDictionary dictionaryWithCapacity:0];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UILabel *lbl in view.subviews) {
                if ([lbl isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
                    NSString *btnTitle = lbl.text;
                    if (lbl.text.length > 0) {
                        [tabBarButtonDic setObject:view forKey:btnTitle];
                    }
                    break;
                }
            }
        }
    }
    
    NSInteger itemCount = self.items.count;
    BOOL showCenterBtn = YES;
    self.centerBtn.hidden = !showCenterBtn;
    if (showCenterBtn) {
        itemCount += 1;
    }
    CGFloat bottomOffset = kIsiPhoneX ? kDangerAreaHeight : 0;
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    CGFloat barItemWidth = 0;
    if (itemCount > 0) {
        barItemWidth = barWidth / itemCount;
    }
    CGFloat barItemHeight = barHeight - bottomOffset;
    
    __block CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    
    __block int i = 0;
    [self.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *tabBarButton = tabBarButtonDic[obj.title];
        if (showCenterBtn) {
            if (i == itemCount / 2) {
                i += 1;
            }
        }
        buttonX = i * barItemWidth;
        tabBarButton.frame = CGRectMake(buttonX, buttonY, barItemWidth, barItemHeight);
        ++i;
    }];
    
    CGFloat onlineBtnSize = 70;
    self.centerBtn.frame = CGRectMake( (barWidth - onlineBtnSize)/2.0f, -(onlineBtnSize/2.0f), onlineBtnSize, onlineBtnSize);
    // 把中间按钮带到视图最前面
    [self bringSubviewToFront:self.centerBtn];
}

#pragma mark - UIViewGeometry
// 重写hitTest方法，让超出tabBar部分也能响应事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    UIView *result = [super hitTest:point withEvent:event];
    // 如果事件发生在tabbar里面直接返回
    if (result) {
        return result;
    }
    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
    for (UIView *subview in self.subviews) {
        // 把这个坐标从tabbar的坐标系转为subview的坐标系
        CGPoint subPoint = [subview convertPoint:point fromView:self];
        result = [subview hitTest:subPoint withEvent:event];
        // 如果事件发生在subView里就返回
        if (result) {
            return result;
        }
    }
    return nil;
}

@end
