//
//  CWHFormRows.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "BaseEntity.h"
#import <UIKit/UIKit.h>
#import "YYText.h"

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

@property (nonatomic ,assign)CGFloat leadMargin;
@property (nonatomic ,assign)CGFloat topMargin;
@property (nonatomic ,assign)CGFloat trailMargin;
@property (nonatomic ,assign)CGFloat bottomMargin;
@property (nonatomic ,assign)CGFloat font;

@property (nonatomic ,assign)CGSize useSize;
@property (nonatomic ,assign)CGFloat titleWidth;
@property (nonatomic ,assign)BOOL isCutLine;

@property (nonatomic ,strong)NSMutableAttributedString *attriTitle;

@property (nonatomic ,strong)NSMutableAttributedString *attriDetail;

@property (nonatomic ,strong)NSAttributedString *attStr;

@property (nonatomic ,strong)YYTextLayout *yyLayout;

@end
