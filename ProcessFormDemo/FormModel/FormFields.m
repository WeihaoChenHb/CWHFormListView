//
//  FormFields.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormFields.h"

@implementation FormFields

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.isNecessary = YES;
        self.repetition = NO;
    }
    return self;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"rows": [FormRows class]};
}

@end
