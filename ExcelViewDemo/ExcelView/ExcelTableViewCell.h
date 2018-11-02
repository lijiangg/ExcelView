//
//  ExcelTableViewCell.h
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/28.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExcelModel.h"
@interface ExcelTableViewCell : UITableViewCell <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScroView;


- (void)setModel:(ExcelModel *)model indexPath:(NSIndexPath *)indexPath;


@property (copy, nonatomic) void(^itemOnClick)(UIButton *sender, NSIndexPath *indexPath, NSInteger index);
+ (CGFloat) cellHeight;
@end
