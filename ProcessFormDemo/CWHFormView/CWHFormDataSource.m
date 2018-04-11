//
//  CWHFormDateSource.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormDataSource.h"
#import "NSDictionary+SafeValue.h"
#import <YYText.h>

@interface CWHFormDataSource ()

@property (nonatomic ,strong)id Json;

@property (nonatomic ,strong)NSDictionary *resource;

@property (nonatomic ,assign)CGRect frame;

@end

@implementation CWHFormDataSource

- (instancetype)initWithFrame:(CGRect)frame Json:(id)Json resource:(id)resource {
    
    if (self = [super init]) {
        
        _Json = Json;
        _model = [CWHFormModel yy_modelWithJSON:Json];
        _resource = resource;
        _frame = frame;
        [self modelHandle];
    }
    return self;
}

- (void)modelHandle {
    
    [self.model.sections enumerateObjectsUsingBlock:^(CWHFormSections *section, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self sectionHandleWithSection:section];
    }];
    
}

- (void)sectionHandleWithSection:(CWHFormSections *)section {
    
    NSMutableArray *sectionRows = [NSMutableArray new];
    
    [section.fields enumerateObjectsUsingBlock:^(CWHFormFields *field, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray *rows = [self fieldsHandleWith:field];
        [sectionRows addObjectsFromArray:rows];
        
    }];
    
    section.rows = [sectionRows copy];
}

- (NSArray *)fieldsHandleWith:(CWHFormFields *)field {
    
    if (!field.isNecessary) {
        if (![self.resource safe_ValueForKeyPath:field.keyPath]) {
            return nil;
        }
    }
    
    if (field.repetition) {
        NSArray *arr = (NSArray *)[self.resource safe_ValueForKeyPath:field.keyPath];
        if (!arr.count) {
            return nil;
        }
        NSMutableArray *rows = [NSMutableArray new];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
           
            CWHFormRows *lastRow = [field.rows lastObject];
            [field.rows enumerateObjectsUsingBlock:^(CWHFormRows *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString * text = [model safe_ValueForKeyPath:obj.keyPath];
                obj.detail = text;
                
                CGFloat width = [[obj.size safe_valueForKey:@"width"] floatValue] / 100 * self.frame.size.width;
                
                CGFloat w = [self sizeWithText:obj.title height:17 font:17].width;
                
                NSMutableAttributedString *muAttStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",obj.title,obj.detail]];
                muAttStr.yy_firstLineHeadIndent = -w;
                muAttStr.yy_headIndent = 10;
                obj.attStr = muAttStr;
                YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(width, CGFLOAT_MAX) text:muAttStr];
                muAttStr.yy_font = [UIFont systemFontOfSize:17];
                muAttStr.yy_firstLineHeadIndent = -w;
                muAttStr.yy_headIndent = w;
              
                obj.useSize = CGSizeMake(width, layout.textBoundingSize.height + obj.topMargin + obj.bottomMargin);
                CWHFormRows *newRow = [CWHFormRows new];
                newRow = [obj mutableCopy];
                [rows addObject:newRow];
                
                if (lastRow == obj) {
                    CWHFormRows *cutRows = [[CWHFormRows alloc] init];
                    cutRows.isCutLine = YES;
                    cutRows.size = @{@"width" : @(100)};
                    cutRows.useSize = CGSizeMake(self.frame.size.width, 2);
                    [rows addObject:cutRows];
                }
            }];
        }];
        
        return rows;
    } else {
        
        NSMutableArray *rows = [NSMutableArray arrayWithArray:field.rows];
        
        [field.rows enumerateObjectsUsingBlock:^(CWHFormRows *obj, NSUInteger idx, BOOL * _Nonnull stop) {

            NSString * text =  [self.resource safe_ValueForKeyPath:obj.keyPath];
            obj.detail = text;
            
            CGFloat width = [[obj.size safe_valueForKey:@"width"] floatValue] / 100 * self.frame.size.width;
            
            CGFloat w = [self sizeWithText:obj.title height:17 font:17].width;
            
            NSMutableAttributedString *muAttStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",obj.title,obj.detail]];
            muAttStr.yy_font = [UIFont systemFontOfSize:17];
            muAttStr.yy_firstLineHeadIndent = -w;
            muAttStr.yy_headIndent = w;
            obj.attStr = muAttStr;
            YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(207, CGFLOAT_MAX) text:muAttStr];
            
            obj.useSize = CGSizeMake(width, layout.textBoundingSize.height + obj.topMargin + obj.bottomMargin);
        }];
        CWHFormRows *cutRows = [[CWHFormRows alloc] init];
        cutRows.isCutLine = YES;
        cutRows.size = @{@"width" : @(100)};
//        cutRows.rowHeight = 10;
        cutRows.useSize = CGSizeMake(self.frame.size.width, 2);
        [rows addObject:cutRows];
        
        return [rows copy];
        
    }
}

- (CGSize)sizeWithText:(NSString *)text height:(CGFloat)height font:(CGFloat)font
{
    CGSize size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:NULL].size;
    
    return size;
}

@end
