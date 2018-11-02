//
//  ExcelTableViewCell.m
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/28.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "ExcelTableViewCell.h"

#define itemTag  3333
@implementation ExcelTableViewCell{
    ExcelModel *_model;
    NSIndexPath *_indexPath;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _contentScroView.delegate = self;
  
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrollChange:) name:SCROLL_X_CHANGE object:nil];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(ExcelModel *)model indexPath:(NSIndexPath *)indexPath {
    _model = model;
    _indexPath = indexPath;
    
    if (_model.title) {
        [_titleButton setTitle:_model.title forState:UIControlStateNormal];
        [_titleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_titleButton setBackgroundColor:excelHeaderColor];
        _titleButton.tag = itemTag;
        [_titleButton addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    _contentScroView.contentSize = CGSizeMake(_model.contentArray.count * excelItemSizeWidth, 0);
    
    for (int index = 0; index < _model.contentArray.count; index ++) {
        NSString *title = _model.contentArray[index];
        UIButton *btn = [_contentScroView viewWithTag:index + itemTag + 1];
        if (!btn) {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
        }
        [btn setBackgroundColor:excelColor];
        btn.layerBorderWidth = 1;
        btn.layerBorderColor = [UIColor blackColor];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        CGFloat x = excelItemSizeWidth * index;
        btn.frame = CGRectMake(x, 0, excelItemSizeWidth, [ExcelTableViewCell cellHeight]);
        [_contentScroView addSubview:btn];
        
        btn.tag = index + itemTag + 1;
        [btn addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [[NSNotificationCenter defaultCenter]postNotificationName:SCROLL_X_CHANGE object:nil userInfo:@{@"x":@(scrollView.contentOffset.x)}];
}

- (void)scrollChange:(NSNotification *)not {
    CGFloat x = [not.userInfo[@"x"] floatValue];
    _contentScroView.contentOffset = CGPointMake(x, 0);
}

- (void)itemOnClick:(UIButton *)sender{
    if (_itemOnClick) {
        _itemOnClick(sender,_indexPath,sender.tag - itemTag);
    }
}

+ (CGFloat) cellHeight {
    return excelItemSizeHeight;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:SCROLL_X_CHANGE object:nil];
}



@end
