//
//  FromModel.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FromModel.h"

@implementation FromModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sections" : [FormSections class]};
}


@end
