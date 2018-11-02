//
//  UIView+category.m
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/29.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "UIView+category.h"

@implementation UIView (category)

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}
- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderWidth:(CGFloat)layerBorderWidth {
    self.layer.borderWidth = layerBorderWidth;
}

- (CGFloat)layerBorderWidth {
    return self.layer.borderWidth;
}

- (void)setLayerCornerRadius:(CGFloat)layerCornerRadius {
    self.layer.cornerRadius = layerCornerRadius;
}

- (CGFloat)layerCornerRadius {
    return self.layer.cornerRadius;
}

@end
