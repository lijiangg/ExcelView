//
//  ExcelHeaderView.m
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/28.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "ExcelHeaderView.h"

#define itemTag  3333
@implementation ExcelHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    _scroView.delegate = self;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrollChange:) name:SCROLL_X_CHANGE object:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [[NSNotificationCenter defaultCenter]postNotificationName:SCROLL_X_CHANGE object:nil userInfo:@{@"x":@(scrollView.contentOffset.x)}];
}

- (void)scrollChange:(NSNotification *)not {
    CGFloat x = [not.userInfo[@"x"] floatValue];
    _scroView.contentOffset = CGPointMake(x, 0);
}


- (void)setModel:(ExcelModel *)model {
    _model = model;
    
    if (_model.title) {
        [_titleButton setTitle:_model.title forState:UIControlStateNormal];
        [_titleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_titleButton setBackgroundColor:excelHeaderColor];
        _titleButton.tag = itemTag;
        [_titleButton addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    _scroView.contentSize = CGSizeMake(_model.contentArray.count * excelItemSizeWidth, 0);

    for (int index = 0; index < _model.contentArray.count; index ++) {
        NSString *title = _model.contentArray[index];
        UIButton *btn = [_scroView viewWithTag:index + itemTag + 1];
        if (!btn) {
            btn = [FactoryTool getExcelItemButtonWithBackgroundColor:excelColor layerBorderWidth:1 layerBorderColor:[UIColor blackColor] titleColor:[UIColor redColor]];
        }
        [btn setTitle:title forState:UIControlStateNormal];
        CGFloat x = excelItemSizeWidth * index;
        btn.frame = CGRectMake(x, 0, excelItemSizeWidth, [ExcelHeaderView headerHeight]);
        [_scroView addSubview:btn];
        
        btn.tag = index + itemTag + 1;
        [btn addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}




- (void)itemOnClick:(UIButton *)sender{
    if (_itemOnClick) {
        _itemOnClick(sender, sender.tag - itemTag);
    }
}

+ (CGFloat)headerHeight {
    return excelItemSizeHeight;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:SCROLL_X_CHANGE object:nil];
}
@end
