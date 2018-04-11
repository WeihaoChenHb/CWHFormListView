//
//  NSDictionary+SafeValue.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/3.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "NSDictionary+SafeValue.h"

@implementation NSDictionary (SafeValue)

- (id)safe_ValueForKeyPath:(id)key {
    if (!key) return nil;
    
    id value = nil;
    
    @try {
        value = [self valueForKeyPath:key];
    }
    @catch (NSException *exception) {
        if (exception) return nil;
    }
    
    if (!value) return nil;
    
    if (value != [NSNull null] && [value isKindOfClass:[NSString class]] && [value length] == 0) return nil;
    
    if (value == [NSNull null]) return nil;
    
    return value;
    
}

- (id)safe_valueForKey:(id)key {
    
    if (!key) return nil;
    
    id value = nil;

    @try {
        value = [self valueForKeyPath:key];
    }
    @catch (NSException *exception) {
        if (exception) return nil;
    }
    
    if (!value) return nil;
    
    if (value != [NSNull null] && [value isKindOfClass:[NSString class]] && [value length] == 0) return nil;
    
    if (value == [NSNull null]) return nil;
    
    return value;
}

- (void)safe_setValue:(id)value forKey:(id)key {
    
    if (value && key && value != [NSNull null]) [self setValue:value forKey:key];
}

@end
