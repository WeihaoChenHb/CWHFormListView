//
//  CWHFormCollectionReusableView.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/11.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormCollectionReusableView.h"
#import "Masonry.h"

@interface CWHFormCollectionReusableView ()

@property (nonatomic ,strong)UILabel *label;

@end

@implementation CWHFormCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    _label = [[UILabel alloc] init];
    [self addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self);
    }];
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    
    _label.text = title;
}

@end
