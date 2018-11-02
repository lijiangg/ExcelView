//
//  FactoryTool.m
//  ExcelViewDemo
//
//  Created by lijiang on 2018/11/2.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "FactoryTool.h"
#import "UIView+category.h"
@implementation FactoryTool

+ (UIButton *)getExcelItemButtonWithBackgroundColor:(UIColor *)backgroundColor
                         layerBorderWidth:(NSInteger)layerBorderWidth
                         layerBorderColor:(UIColor *)layerBorderColor
                               titleColor:(UIColor *)titleColor {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:backgroundColor];
    btn.layerBorderWidth = layerBorderWidth;
    btn.layerBorderColor = layerBorderColor;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];

    return btn;
}
@end
