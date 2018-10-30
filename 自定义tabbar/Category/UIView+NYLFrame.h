//
//  UIView+NYLFrame.h
//  JDS
//
//  Created by 聂银龙 on 17/3/10.
//  Copyright © 2017年 com.qianmi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NYLFrame)


//  高度
@property (nonatomic,assign) CGFloat height;
//  宽度
@property (nonatomic,assign) CGFloat width;

//  Y
@property (nonatomic,assign) CGFloat top;
//  X
@property (nonatomic,assign) CGFloat left;

//  Y + Height
@property (nonatomic,assign) CGFloat bottom;
//  X + width
@property (nonatomic,assign) CGFloat right;



@end
