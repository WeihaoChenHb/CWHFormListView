//
//  FormRow.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormRows.h"

@implementation FormRows

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.isCutLine = NO;
    }
    return self;
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"modules" : [FormModules class]};
}

@end
