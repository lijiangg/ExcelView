//
//  ExcelHeaderView.h
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/28.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExcelModel.h"



@interface ExcelHeaderView : UITableViewHeaderFooterView <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scroView;

@property (strong, nonatomic) ExcelModel *model;

@property (copy, nonatomic) void(^itemOnClick)(UIButton *sender, NSInteger index);


+ (CGFloat) headerHeight;
@end
