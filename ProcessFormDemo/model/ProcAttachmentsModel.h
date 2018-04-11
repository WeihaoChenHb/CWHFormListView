//
//  ProcAttachmentsModel.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"

@interface ProcAttachmentsModel : BaseEntity

@property (nonatomic ,strong)NSString *bussinesId;
@property (nonatomic ,strong)NSString *updateDate;
@property (nonatomic ,strong)NSString *remarks;
@property (nonatomic ,strong)NSString *src;
@property (nonatomic ,assign)NSInteger sort;
@property (nonatomic ,strong)NSString *size;
@property (nonatomic ,strong)NSString *createDate;
@property (nonatomic ,strong)NSString *name;

@end
