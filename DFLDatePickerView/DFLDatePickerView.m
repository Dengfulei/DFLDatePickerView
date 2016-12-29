//
//  DFLDatePickerView.m
//  DFLDatePickerView
//
//  Created by 杭州移领 on 16/12/27.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "DFLDatePickerView.h"
const CGFloat DatePickerViewH = 250.0f;
const CGFloat ToolBarH        = 44.f;
const CGFloat ButtonW         = 50.f;
const CGFloat margin          = 10.f;

@interface DFLDatePickerView ()
@property (nonatomic , strong) UIDatePicker *datePicker;

@property (nonatomic , strong) UIView *toolBarView;

@property (nonatomic , strong) UIView *backgroundView;
@end


@implementation DFLDatePickerView

+ (DFLDatePickerView *)showedToView:(UIView *)superView frame:(CGRect)frame {
    
    DFLDatePickerView *datePickerView = [[self alloc] initWithFrame:frame];
    
    return datePickerView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [self addSubview:self.backgroundView];
    }
    
    return self;
}


- (UIView *)backgroundView {
    
    if (!_backgroundView) {
        
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - (ToolBarH + DatePickerViewH), CGRectGetWidth(self.frame), DatePickerViewH + ToolBarH)];
        _backgroundView.backgroundColor = [UIColor whiteColor];
        [_backgroundView addSubview:self.toolBarView];
        [_backgroundView addSubview:self.datePicker];
    }
    
    return _backgroundView;
}

- (UIDatePicker *)datePicker {
    
    if (!_datePicker) {
       
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.frame = CGRectMake(0, ToolBarH, self.frame.size.width, DatePickerViewH) ;
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = UIDatePickerModeDate;
  
    }
    return _datePicker;
}

- (UIView *)toolBarView {
    
    if (!_toolBarView) {
        
        _toolBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, ToolBarH)];
        _toolBarView.backgroundColor = [UIColor whiteColor];
        UIButton *leftButton = [self configurateButtonWithFrame:CGRectMake(margin, 0, ButtonW, ToolBarH) color:[UIColor lightGrayColor] title:@"取 消"];
        [leftButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        [_toolBarView addSubview:leftButton];
        
        UIButton *rightButton = [self configurateButtonWithFrame:CGRectMake(CGRectGetWidth(_toolBarView.frame) - (ButtonW + margin), 0, ButtonW, ToolBarH) color:[UIColor blueColor] title:@"确 定"];
         [rightButton addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
        [_toolBarView addSubview:rightButton];
    }
    
    return _toolBarView;
}

- (void)cancel {
    
    [self removeFromSuperview];
}

- (void)sure {
    NSDateComponents *comps = [[NSCalendar  currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.datePicker.date];
    if (self.selectedDateBlock) {
        self.selectedDateBlock(comps.year,comps.month,comps.day);
    }
    NSDateFormatter *dateFormmater = [[NSDateFormatter alloc]init];
    [dateFormmater setDateFormat:@"yyyy年MM月dd日hh时mm分ss"];
    NSString *string = [dateFormmater stringFromDate:self.datePicker.date];

    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerView:DidSelectedDateString:)]) {
        [self.delegate pickerView:self DidSelectedDateString:string];
    }

   
}

- (void)configurateCallFunWithDateString:(SelectedDateBlock)callBack {
    
    _selectedDateBlock = callBack;
}

- (UIButton *)configurateButtonWithFrame:(CGRect)frame
                                   color:(UIColor *)color
                                   title:(NSString *)title {
    
    UIButton *button = ({
        button = [[UIButton alloc] initWithFrame:frame];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:color forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button;
    });
    return button;

}

@end
