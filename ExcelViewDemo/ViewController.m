//
//  ViewController.m
//  ExcelViewDemo
//
//  Created by lijiang on 2018/10/28.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "ViewController.h"
#import "ExcelView.h"
@interface ViewController ()<ExcelViewDelegate>
@property (weak, nonatomic) IBOutlet ExcelView *excelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    ExcelModel *headerModel = [ExcelModel new];
    headerModel.title = @"学生姓名";
    headerModel.contentArray = @[@"年龄",@"爱好",@"工作",@"邮箱",@"对象",@"父母",
                                 @"年龄",@"爱好",@"工作",@"邮箱",@"对象",@"父母"];
    _excelView.headerModel = headerModel;
    
    ExcelModel *contentModel = [ExcelModel new];
    contentModel.title = @"小刘";
    contentModel.contentArray = @[@"16",@"打游戏",@"开发",@"3944423@163.com",@"翠花",@"隐私",
                                  @"16",@"打游戏",@"开发",@"3944423@163.com",@"翠花",@"隐私"];
    _excelView.dataArray = @[contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel,contentModel];
    
    [_excelView drawExcel];
    NSLog(@"ss");
}

- (void)itemOnClick:(UIButton *)sender indexPath:(NSIndexPath *)indexPath index:(NSInteger)index {
    NSLog(@"点击了第%ld行第%ld个",indexPath.row + 1 , index + 1);
}

- (void)headerItemOnClick:(UIButton *)sender index:(NSInteger)index {
    NSLog(@"点击了第%ld个", index + 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
