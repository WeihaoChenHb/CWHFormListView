//
//  ProcActModel.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"

@interface ProcActModel : BaseEntity

@property (nonatomic ,strong)NSString *procDefName;
@property (nonatomic ,strong)NSString *procInsId;
@property (nonatomic ,strong)NSString *auditStatus;
@property (nonatomic ,strong)NSString *processType;
@property (nonatomic ,strong)NSString *procDefKey;
@property (nonatomic ,strong)NSString *procDefId;
@property (nonatomic ,strong)NSString *taskDefKey;
@property (nonatomic ,strong)NSString *taskName;
@property (nonatomic ,strong)NSString *taskId;
@property (nonatomic ,strong)NSString *processStatus;

@end
