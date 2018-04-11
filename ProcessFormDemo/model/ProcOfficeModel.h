//
//  ProcOfficeModel.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/3.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"

@interface ProcOfficeModel : BaseEntity

@property (nonatomic ,strong)NSString *name;
@property (nonatomic ,strong)NSString *parentIds;
@property (nonatomic ,strong)NSString *sort;
@property (nonatomic ,strong)NSString *parentId;
@property (nonatomic ,strong)NSString *fullName;
@property (nonatomic ,strong)NSString *type;
@property (nonatomic ,strong)NSString *parentNames;

@end
