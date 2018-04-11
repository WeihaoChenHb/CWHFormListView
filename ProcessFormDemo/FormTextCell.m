//
//  FormTextCell.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/3.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormTextCell.h"
#import "Masonry.h"

@interface FormTextCell ()

@property (nonatomic ,strong) UILabel *titleLb;

@property (nonatomic ,strong) UILabel *detailLb;

@end

@implementation FormTextCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)createUI {
    
    self.titleLb = [[UILabel alloc] init];
    [self addSubview:self.titleLb];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
        
    }];
    
    self.detailLb = [[UILabel alloc] init];
    self.detailLb.numberOfLines = 0;
    [self addSubview:self.detailLb];
    
    [self.detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLb.mas_right);
        make.centerY.equalTo(self.titleLb);
        make.right.equalTo(self).with.offset(-10);
    }];
}

#pragma mark - setter and getter

- (void)setTitleFont:(CGFloat)titleFont {
    
    _titleFont = titleFont;
    self.titleLb.font = [UIFont systemFontOfSize:titleFont];
}

- (void)setDetailFont:(CGFloat)detailFont {
    
    _detailFont = detailFont;
    self.detailLb.font = [UIFont systemFontOfSize:detailFont];
    
}

- (void)setTitleTextColor:(UIColor *)titleTextColor {
    
    _titleTextColor = titleTextColor;
    self.titleLb.textColor = titleTextColor;
}

- (void)setDetailTextColor:(UIColor *)detailTextColor {
    
    _detailTextColor = detailTextColor;
    self.detailLb.textColor = detailTextColor;
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLb.text = title;
}

- (void)setDetail:(NSString *)detail {
    
    _detail = detail;
    self.detailLb.text = detail;
    
    self.height = [self.detailLb sizeThatFits:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)].height;
}

@end
