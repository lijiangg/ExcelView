//
//  ExcelModel.h
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/29.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+category.h"
#import "Constant.h"

@interface ExcelModel : NSObject

@property (copy, nonatomic)NSString *title;
@property (copy, nonatomic)NSArray *contentArray;
@end
