//
//  NSDictionary+SafeValue.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/3.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeValue)

- (id)safe_valueForKey:(id)key;

- (void)safe_setValue:(id)value forKey:(id)key;

- (id)safe_ValueForKeyPath:(id)key;

@end
