//
//  ProcLeaveDataModel.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"

@interface ProcLeaveDataModel : BaseEntity

@property (nonatomic ,strong)NSString *updateDate;
@property (nonatomic ,strong)NSString *remarks;
@property (nonatomic ,strong)NSString *endTime;
@property (nonatomic ,strong)NSString *days;
@property (nonatomic ,strong)NSString *leaveId;
@property (nonatomic ,strong)NSString *createDate;
@property (nonatomic ,strong)NSString *startTime;

@end
