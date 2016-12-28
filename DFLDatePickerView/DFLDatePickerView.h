//
//  DFLDatePickerView.h
//  DFLDatePickerView
//
//  Created by 杭州移领 on 16/12/27.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectedDateBlock) (NSInteger year,NSInteger month,NSInteger day);
@class DFLDatePickerView;
@protocol DFLDatePickerViewDelegate <NSObject>

- (void)pickerView:(DFLDatePickerView *)pickerView DidSelectedDateString:(NSString *)dateString;

@end
@interface DFLDatePickerView : UIView

@property (nonatomic , assign) id <DFLDatePickerViewDelegate> delegate;

@property (nonatomic ,copy) SelectedDateBlock selectedDateBlock;

+ (DFLDatePickerView *)showedToView:(UIView *)superView frame:(CGRect)frame;

- (void)configurateCallFunWithDateString:(SelectedDateBlock) callBack;
@end
