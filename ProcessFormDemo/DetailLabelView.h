//
//  DetailLabelView.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/2/25.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailLabelView : UIView

@property (nonatomic ,assign) CGFloat titleFont;

@property (nonatomic ,assign) CGFloat detailFont;

@property (nonatomic ,strong) UIColor *titleTextColor;

@property (nonatomic ,strong) UIColor *detailTextColor;

@property (nonatomic ,strong) NSString *title;

@property (nonatomic ,strong) NSString *detail;

@property (nonatomic ,assign) CGFloat height;


@property (nonatomic ,strong) NSAttributedString *text;


@end
