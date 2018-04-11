//
//  CWHFormRows.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"
#import <UIKit/UIKit.h>

@interface CWHFormRows : BaseEntity <NSCopying, NSMutableCopying>

@property (nonatomic ,strong)NSString *backColor;
@property (nonatomic ,strong)NSString *titleColor;
@property (nonatomic ,strong)NSString *detailColor;

@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *keyPath;
@property (nonatomic ,strong)NSString *linkPath;

@property (nonatomic ,strong)NSString *detail;
@property (nonatomic ,assign)CGFloat rowHeight;
@property (nonatomic ,strong)NSDictionary *size;

@property (nonatomic ,assign)CGSize useSize;
@property (nonatomic ,assign)BOOL isCutLine;

@property (nonatomic ,strong)NSAttributedString *attStr;

@end
