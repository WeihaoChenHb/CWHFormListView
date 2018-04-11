//
//  FormHeaderView.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/3.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormHeaderView : UITableViewHeaderFooterView

@property (nonatomic ,strong)NSString *backColor;

@property (nonatomic ,strong)NSString *headerText;
@property (nonatomic ,strong)NSString *headerColor;
@property (nonatomic ,assign)NSInteger headerFont;

@property (nonatomic ,strong)NSString *detailText;
@property (nonatomic ,strong)NSString *detailColor;
@property (nonatomic ,assign)NSInteger detailFont;

@end
