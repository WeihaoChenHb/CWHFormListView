//
//  FormSections.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormSections.h"

@implementation FormSections

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"fields" : [FormFields class]};
}

@end
