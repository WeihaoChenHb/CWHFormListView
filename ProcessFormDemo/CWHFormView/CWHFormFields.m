//
//  CWHFormFields.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormFields.h"

@implementation CWHFormFields

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.isNecessary = YES;
        self.repetition = NO;
    }
    return self;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"rows" : [CWHFormRows class]};
}

@end
