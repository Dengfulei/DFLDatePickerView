//
//  ViewController.m
//  DFLDatePickerView
//
//  Created by 杭州移领 on 16/12/27.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "ViewController.h"
#import "DFLDatePickerView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    DFLDatePickerView *view = [DFLDatePickerView showedToView:self.view frame:self.view.bounds];
    [view configurateCallFunWithDateString:^(NSInteger year,NSInteger month,NSInteger day) {
        NSLog(@"%ld===%ld====%ld",year,month ,day);

    }];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
