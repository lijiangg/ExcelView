//
//  UIView+category.h
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/29.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (category)
@property (strong, nonatomic) IBInspectable UIColor *layerBorderColor;
@property (assign, nonatomic) IBInspectable CGFloat layerBorderWidth;
@property (assign, nonatomic) IBInspectable CGFloat layerCornerRadius;
@end
