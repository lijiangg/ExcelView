//
//  ExcelView.m
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/28.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "ExcelView.h"



@implementation ExcelView {
    CGFloat currentScale; //当前捏合倍数
}
static NSString *cellID = @"ExcelTableViewCell";
static NSString *headerID = @"ExcelHeaderView";
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initial];
        [self setSubViews];
        [self layout];
        
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerNib:[UINib nibWithNibName:@"ExcelTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
        [_tableView registerNib:[UINib nibWithNibName:@"ExcelHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:headerID];
    }
    return self;
}
- (void) initial {
    currentScale = 1.0;
}
- (void)setSubViews{
    _view = [[UINib nibWithNibName:@"ExcelView" bundle:nil]instantiateWithOwner:self options:nil].firstObject;
    _view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view];
    
    [self addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinGesture:)]];
  
}

- (void)layout {
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self addConstraint:leading];
    [self addConstraint:top];
    [self addConstraint:right];
    [self addConstraint:bottom];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExcelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    [cell setModel:_dataArray[indexPath.row] indexPath:indexPath];

    
    __weak typeof(self) weakSelf = self;
    cell.itemOnClick = ^(UIButton *sender, NSIndexPath *indexPath, NSInteger index) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(itemOnClick:indexPath:index:)]) {
            [weakSelf.delegate itemOnClick:sender indexPath:indexPath index:index];
        }
    };
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ExcelHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    headerView.frame = CGRectMake(0, 0, self.frame.size.width, [ExcelHeaderView headerHeight]);
    headerView.model = _headerModel;

    
    __weak typeof(self) weakSelf = self;
    headerView.itemOnClick = ^(UIButton *sender, NSInteger index) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(headerItemOnClick:index:)]) {
            [weakSelf.delegate headerItemOnClick:sender index:index];
        }
    };
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ExcelTableViewCell cellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [ExcelHeaderView headerHeight];
}

- (void) drawExcel {
    [_tableView reloadData];

}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
}

- (void)setHeaderModel:(ExcelModel *)headerModel {
    _headerModel = headerModel;
}



- (void)pinGesture:(UIPinchGestureRecognizer *)pin {
    if (pin.state == UIGestureRecognizerStateBegan) {
        pin.scale = currentScale;
    } else if (pin.state == UIGestureRecognizerStateEnded ||pin.state == UIGestureRecognizerStateChanged) {
        if (pin.scale > 1.5) {
            pin.scale = 1.5;
        }
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, pin.scale, pin.scale);
        currentScale = pin.scale;
    }
    
}



@end
