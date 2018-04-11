//
//  ProcessModel.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "ProcessModel.h"

@implementation ProcessModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"leaveData" : [ProcLeaveDataModel class],
              @"attachments" : [ProcAttachmentsModel class],
              };
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
