//
//  UIView+Category.m
//  JDS
//
//  Created by 聂银龙 on 17/3/13.
//  Copyright © 2017年 com.qianmi.com. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
+ (UIView *)viewWithBackGroundColor:(UIColor *)color {
    UIView *view = [[UIView alloc] init];
    if (color) {
        view.backgroundColor = color;
    }
    return view;
}
@end
