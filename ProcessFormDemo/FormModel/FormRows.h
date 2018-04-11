//
//  FormRow.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"
#import "FormModules.h"
#import <UIKit/UIKit.h>

@interface FormRows : BaseEntity

@property (nonatomic ,strong)NSString *textColor;

@property (nonatomic ,strong)NSString *backColor;

@property (nonatomic ,strong)NSArray *modules;

@property (nonatomic ,assign)CGFloat rowHeight;

@property (nonatomic ,assign)BOOL isCutLine;

@end
