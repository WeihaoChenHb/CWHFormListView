//
//  BaseEntity.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/1.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface BaseEntity : NSObject

@property (nonatomic ,copy) NSString *_id;

/**
 快速将json转为实体对象
 
 @param Json string
 
 @return Entity对象
 */
+ (id)objectWithJson:(id)Json;

/**
 快速将Dictionary转为实体对象
 
 @param dict 需要转换的字典
 
 @return Entity对象
 */
+ (id)objectWithDictionary:(NSDictionary *)dict;

/**
 自定义属性映射
 
 + (NSDictionary *)modelCustomPropertyMapper {
 NSMutableDictionary *dict = [NSMutableDictionary dictionary];
 [dict setDictionary:[super modelCustomPropertyMapper]];
 [dict addEntriesFromDictionary:@{@"roles":@"roleList"}];
 return dict;
 }
 
 
 @return A custom mapper for properties.
 */
+ (NSDictionary *)modelCustomPropertyMapper;

/**
 集合类属性，内容是其他类的对象，需要在这里做映射，并涵盖其子类集合类属性的映射
 
 Example:
 
 + (NSDictionary *)modelContainerPropertyGenericClass {
 return @{@"shadows" : [YYShadow class],
 @"borders" : YYBorder.class,
 @"attachments" : @"YYAttachment" };
 }
 @end
 
 @return A class mapper.
 */
+ (NSDictionary *)modelContainerPropertyGenericClass;

@end
