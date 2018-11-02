//
//  FactoryTool.h
//  ExcelViewDemo
//
//  Created by lijiang on 2018/11/2.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FactoryTool : NSObject
+ (UIButton *)getExcelItemButtonWithBackgroundColor:(UIColor *)backgroundColor
                                   layerBorderWidth:(NSInteger)layerBorderWidth
                                   layerBorderColor:(UIColor *)layerBorderColor
                                         titleColor:(UIColor *)titleColor;
@end
