//
//  CWHFormSections.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"
#import "CWHFormFields.h"

@interface CWHFormSections : BaseEntity

@property (nonatomic ,strong)NSString *textColor;
@property (nonatomic ,strong)NSString *backColor;
@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSArray *fields;

@property (nonatomic ,strong)NSArray *rows;

@end
