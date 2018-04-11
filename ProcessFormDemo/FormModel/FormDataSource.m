//
//  FormDataSource.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormDataSource.h"
#import "NSDictionary+SafeValue.h"

@interface FormDataSource ()

@property (nonatomic ,strong)id JSON;

@property (nonatomic ,strong)NSDictionary *dic;

@end

@implementation FormDataSource

- (instancetype)initWithJSON:(id)JSON dic:(NSDictionary *)dic {
    
    if (self = [super init]) {
        _JSON = JSON;
        _model = [FromModel yy_modelWithJSON:_JSON];
        _dic = dic;
        [self modelHandle];
    }
    
    return self;
}

// 处理数据模型
- (void)modelHandle {
    
    [self.model.sections enumerateObjectsUsingBlock:^(FormSections *section, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self sectionHandleWithSection:section];
        
    }];
}

// 处理每个section的数据
- (void)sectionHandleWithSection:(FormSections *)section {
    
    NSMutableArray *sectionRows = [NSMutableArray new];
    
    [section.fields enumerateObjectsUsingBlock:^(FormFields *field, NSUInteger idx, BOOL * _Nonnull stop) {
    
        
        NSArray *rows = [self fieldsHandleWith:field];
        [sectionRows addObjectsFromArray:rows];
        
    }];
    
    section.rows = [sectionRows copy];
}

// 处理每个模块的数据
- (NSArray *)fieldsHandleWith:(FormFields *)fields {
    
    if (!fields.isNecessary) {
        
        if (![self.dic safe_valueForKey:fields.keyPath]) {
            return nil;
        }
     
    }
    
    if (fields.repetition) {
        NSArray *arr = (NSArray *)[self.dic safe_ValueForKeyPath:fields.keyPath];
        if (!arr.count) {
            return nil;
        }
        NSMutableArray *rows = [NSMutableArray new];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
            
            FormRows *lastRow = [fields.rows lastObject];
            [fields.rows enumerateObjectsUsingBlock:^(FormRows *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                [self rowsHandleWithRow:obj indexModel:model];
                FormRows *newRow = [FormRows new];
                newRow.modules = [obj.modules mutableCopy];
                newRow.isCutLine = obj.isCutLine;
                newRow.backColor = obj.backColor;
                [rows addObject:newRow];
               
                if (lastRow == obj) {
                    FormRows *cutRows = [[FormRows alloc] init];
                    cutRows.isCutLine = YES;
                    [rows addObject:cutRows];
                }
            }];
        }];
        
        return rows;
    } else {
        
        NSMutableArray *rows = [NSMutableArray arrayWithArray:fields.rows];
        
        [fields.rows enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self rowsHandleWithRow:obj indexModel:nil];
        }];
        FormRows *cutRows = [[FormRows alloc] init];
        cutRows.isCutLine = YES;
        [rows addObject:cutRows];
        
        return [rows copy];
        
    }

}

- (void)rowsHandleWithRow:(FormRows *)rows indexModel:(id)indexModel {
    
    [rows.modules enumerateObjectsUsingBlock:^(FormModules *module, NSUInteger idx, BOOL * _Nonnull stop) {
        if (indexModel) {
            module.detail = [indexModel safe_ValueForKeyPath:module.keyPath];
        } else {
            module.detail = [self.dic safe_ValueForKeyPath:module.keyPath];
        }
        
    }];
}


@end
