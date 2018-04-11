//
//  CWHFormModel.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormModel.h"

@implementation CWHFormModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"sections" : [CWHFormSections class]};
}

@end
