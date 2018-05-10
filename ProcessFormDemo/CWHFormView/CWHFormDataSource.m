//
//  CWHFormDateSource.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormDataSource.h"
#import "NSDictionary+SafeValue.h"
#import "UIColor+moreColor.h"

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
    
    switch (field.rowType) {
        case CWHFormRowDefaultType: {
            NSMutableArray *rows = [NSMutableArray new];
            [self rowHandleWithField:field model:self.resource rows:rows];
            
            return [rows copy];
        }
            break;
        case CWHFormRowRepetitionType: {
            
            NSArray *arr = (NSArray *)[self.resource safe_ValueForKeyPath:field.keyPath];
            if (!arr.count) {
                return nil;
            }
            NSMutableArray *rows = [NSMutableArray new];
            [arr enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
                [self rowHandleWithField:field model:model rows:rows];
            }];
            
            return rows;
        }
            break;
        case CWHFormRowNecessaryType: {
            
            if (![self.resource safe_ValueForKeyPath:field.keyPath]) {
                return nil;
            }
            NSMutableArray *rows = [NSMutableArray new];
            [self rowHandleWithField:field model:self.resource rows:rows];
            
            return [rows copy];
        }
            break;
            
        case CWHFormRowMoreOneType: {
            NSArray *arr = (NSArray *)[self.resource safe_ValueForKeyPath:field.keyPath];
            if (!arr.count) {
                return nil;
            }
            NSMutableArray *rows = [NSMutableArray new];
            
            CWHFormRows *lastRow = [field.rows lastObject];
            [field.rows enumerateObjectsUsingBlock:^(CWHFormRows *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:obj.title];
                
                obj.attriTitle = title;
                obj.attriTitle.yy_font = [UIFont systemFontOfSize:obj.font > 0 ? obj.font : 17] ;
                
                obj.attriTitle.yy_color = [UIColor colorWithHexColorString:obj.titleColor] ;
                NSMutableAttributedString *detail = [[NSMutableAttributedString alloc] init];
                
                id lastModel = [arr lastObject];
                
                [arr enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSString * text = [model safe_ValueForKeyPath:obj.keyPath];
                    obj.detail = text;
                    
                    if (model != lastModel) {
                        text = [NSString stringWithFormat:@"%@\n",text];
                    }
                    
                    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:text];
                    [str yy_setTextHighlightRange:str.yy_rangeOfAll color:[UIColor greenColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                        NSLog(@"%@",[self.resource safe_ValueForKeyPath:obj.linkPath]);
                    }];
                    
                    [detail appendAttributedString:str];
                    
                }];
                
                obj.attriDetail = detail;
                obj.attriDetail.yy_color = [UIColor colorWithHexColorString:obj.detailColor];
                obj.attriDetail.yy_font = [UIFont systemFontOfSize:obj.font > 0 ? obj.font : 17];
                CGFloat width = [[obj.size safe_valueForKey:@"width"] floatValue] / 100 * self.frame.size.width;
                
                CGFloat w = [self sizeWithText:obj.title height:17 font:17].width;

                YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(width - w, CGFLOAT_MAX) text:title];
                
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
            
            return [rows copy];
        }
            
            break;
        default:
            return nil;
            break;
    }
    
}

- (void)rowHandleWithField:(CWHFormFields *)field model:(id)model rows:(NSMutableArray *)rows {
    
    CWHFormRows *lastRow = [field.rows lastObject];
    [field.rows enumerateObjectsUsingBlock:^(CWHFormRows *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.attriTitle = [[NSMutableAttributedString alloc] initWithString:obj.title];
        
        obj.attriTitle.yy_font = [UIFont systemFontOfSize:obj.font > 0 ? obj.font : 17] ;
   
        obj.attriTitle.yy_color = [UIColor colorWithHexColorString:obj.titleColor] ;
        
        NSString * text = [model safe_ValueForKeyPath:obj.keyPath];

        obj.detail = text;

        obj.attriDetail = [[NSMutableAttributedString alloc] initWithString:obj.detail];
        
        obj.attriDetail.yy_color = [UIColor colorWithHexColorString:obj.detailColor];
        obj.attriDetail.yy_font = [UIFont systemFontOfSize:obj.font > 0 ? obj.font : 17];
        
        
        CGFloat width = [[obj.size safe_valueForKey:@"width"] floatValue] / 100 * self.frame.size.width;

        CGFloat w = [self sizeWithText:obj.title height:17 font:17].width;
        obj.titleWidth = w;
        YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(width - w, CGFLOAT_MAX) text:obj.attriDetail];

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
}

//- (NSDictionary *)dicWithFont:(CGFloat)font color:(NSString *)color {
//
//    font = font > 0 ? font : 17;
//
//    return @{NSForegroundColorAttributeName : [UIColor colorWithHexColorString:color],NSFontAttributeName : [UIFont systemFontOfSize:font]};
//}

- (CGSize)getSizeWithAttStr:(NSString *)text width:(CGFloat)width dic:(NSDictionary *)dic {
    return [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:dic context:NULL].size;
    
}

- (CGSize)getSizeLabelWithText:(NSAttributedString *)text width:(CGFloat)width {
    
    return [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:NULL].size;
}

- (CGSize)sizeWithText:(NSString *)text height:(CGFloat)height font:(CGFloat)font
{
    CGSize size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:NULL].size;
    
    return size;
}

@end
