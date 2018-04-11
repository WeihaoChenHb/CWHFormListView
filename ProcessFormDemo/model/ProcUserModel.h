//
//  ProcUserModel.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"
#import "ProcOfficeModel.h"

@interface ProcUserModel : BaseEntity

@property (nonatomic ,strong)NSString *position;
@property (nonatomic ,strong)NSString *mobile;
@property (nonatomic ,strong)NSString *name;
@property (nonatomic ,strong)NSString *no;
@property (nonatomic ,strong)ProcOfficeModel *office;

@end
