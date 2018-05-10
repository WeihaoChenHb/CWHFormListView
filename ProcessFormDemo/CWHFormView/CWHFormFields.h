//
//  CWHFormFields.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"
#import "CWHFormRows.h"

typedef NS_ENUM(NSUInteger, CWHFormRowType) {
    CWHFormRowDefaultType,          // 普通类型
    CWHFormRowRepetitionType,       // 重复类型
    CWHFormRowNecessaryType,        // 按照数据，可能会没有
    CWHFormRowMoreOneType           // 多条数据放到一个row里面
};

@interface CWHFormFields : BaseEntity

/** 是否是重复的  YES 是重复的  NO 不是  默认不是 */
@property (nonatomic ,assign)BOOL repetition;

/** 是否是必要的   YES 必要  NO 不必要  默认为必要  ，判断有没有数据，没有数据，则没有 */
@property (nonatomic ,assign)BOOL isNecessary;
@property (nonatomic ,strong)NSString *necessaryPath;
@property (nonatomic ,strong)NSString *keyPath;
@property (nonatomic ,strong)NSArray *rows;

@property (nonatomic ,assign)CWHFormRowType rowType;

@end
