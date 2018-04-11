//
//  ProcessModel.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"
#import "ProcUserModel.h"
#import "ProcActModel.h"
#import "ProcLeaveDataModel.h"
#import "ProcAttachmentsModel.h"


@interface ProcessModel : BaseEntity

@property (nonatomic ,strong)NSString *content;
@property (nonatomic ,strong)NSString *transferDate;
@property (nonatomic ,strong)NSString *procInsId;
@property (nonatomic ,strong)NSString *createDate;
@property (nonatomic ,strong)NSString *phone;
@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *updateDate;
@property (nonatomic ,strong)ProcUserModel *leader;
@property (nonatomic ,strong)ProcUserModel *user;
@property (nonatomic ,strong)ProcActModel *act;
@property (nonatomic ,strong)NSArray *leaveData;
@property (nonatomic ,strong)NSArray *attachments;

@end
