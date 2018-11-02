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
    ExcelModel *_headerModel;
    NSIndexPath *_indexPath;
    void (^layoutFinish)(CGRect frame);
    
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

- (void)setModel:(ExcelModel *)model headerModel:(ExcelModel *)headerModel indexPath:(NSIndexPath *)indexPath {
    _model = model;
    _headerModel = headerModel;
    _indexPath = indexPath;
    
    __weak typeof(self) weakSelf = self;
    layoutFinish = ^(CGRect frame) {
        [weakSelf freshSubViewsWithFrame:frame];
    };
    
    
    
    
}

-(void)freshSubViewsWithFrame:(CGRect)frame{
    if (_model.title) {
        [_titleButton setTitle:_model.title forState:UIControlStateNormal];
        [_titleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_titleButton setBackgroundColor:excelHeaderColor];
        _titleButton.tag = itemTag;
        [_titleButton addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    
    UIButton *btn = [_contentScroView viewWithTag:itemTag + 333];
    if (_model.contentArray.count == 0) {
        //暂无处理
        if (!btn) {
            btn = [FactoryTool getExcelItemButtonWithBackgroundColor:excelColor layerBorderWidth:1 layerBorderColor:[UIColor blackColor] titleColor:[UIColor redColor]];
        }
        _contentScroView.contentSize = CGSizeMake(_headerModel.contentArray.count * excelItemSizeWidth, 0);
        
        [btn setTitle:@"暂无" forState:UIControlStateNormal];
        
        btn.frame = CGRectMake(0, 0, _headerModel.contentArray.count * excelItemSizeWidth, excelItemSizeHeight);
        [_contentScroView addSubview:btn];
        
        
        btn.tag = itemTag + 333;
        //        [btn addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }else {
        //有数据处理
        if (btn) {
            [btn removeFromSuperview];
        }
        _contentScroView.contentSize = CGSizeMake(_model.contentArray.count * excelItemSizeWidth, 0);
        for (int index = 0; index < _model.contentArray.count; index ++) {
            NSString *title = _model.contentArray[index];
            UIButton *btn = [_contentScroView viewWithTag:index + itemTag + 1];
            if (!btn) {
                btn = [FactoryTool getExcelItemButtonWithBackgroundColor:excelColor layerBorderWidth:1 layerBorderColor:[UIColor blackColor] titleColor:[UIColor redColor]];
            }
            [btn setTitle:title forState:UIControlStateNormal];
            CGFloat x = excelItemSizeWidth * index;
            btn.frame = CGRectMake(x, 0, excelItemSizeWidth, [ExcelTableViewCell cellHeight]);
            [_contentScroView addSubview:btn];
            
            btn.tag = index + itemTag + 1;
            [btn addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
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


- (void)layoutSubviews {
    [super layoutSubviews];
    
    layoutFinish(self.frame);
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:SCROLL_X_CHANGE object:nil];
}



@end
