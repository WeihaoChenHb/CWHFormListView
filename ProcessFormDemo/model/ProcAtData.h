//
//  ProcAtData.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"

@interface ProcAtData : BaseEntity

@property (nonatomic ,strong)NSString *updateDate;
@property (nonatomic ,strong)NSString *assetsType;
@property (nonatomic ,strong)NSString *assetsNo;
@property (nonatomic ,strong)NSString *assetsName;
@property (nonatomic ,strong)NSString *transferType;
@property (nonatomic ,strong)NSString *atId;
@property (nonatomic ,strong)NSString *createDate;
@property (nonatomic ,strong)NSString *useLocation;

@end
