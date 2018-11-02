//
//  ExcelView.h
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/28.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExcelTableViewCell.h"
#import "ExcelHeaderView.h"

@protocol ExcelViewDelegate <NSObject>

- (void)itemOnClick:(UIButton *)sender indexPath:(NSIndexPath *)indexPath index:(NSInteger)index;
- (void)headerItemOnClick:(UIButton *)sender index:(NSInteger)index;


@end
@interface ExcelView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) ExcelModel *headerModel;

@property (weak, nonatomic)IBOutlet id<ExcelViewDelegate> delegate;

- (void) drawExcel;
@end
