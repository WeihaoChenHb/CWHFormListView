//
//  CWHFormSections.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormSections.h"

@implementation CWHFormSections

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"fields" : [CWHFormFields class]};
}

@end
