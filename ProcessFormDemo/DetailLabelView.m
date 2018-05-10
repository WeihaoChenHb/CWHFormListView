//
//  DetailLabelView.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/2/25.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "DetailLabelView.h"
#import "Masonry.h"
#import "YYText.h"

@interface DetailLabelView ()

@property (nonatomic ,strong) YYLabel *titleLb;

@property (nonatomic ,strong) YYLabel *detailLb;

@end

@implementation DetailLabelView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

#pragma mark - private method

#pragma mark - setupUI
- (void)createUI {
    
    self.titleLb = [[YYLabel alloc] init];
    self.titleLb.numberOfLines = 0;
//    [self.titleLb sizeToFit];
    [self addSubview:self.titleLb];
    
    self.detailLb = [[YYLabel alloc] init];
    self.detailLb.numberOfLines = 0;
        [self.detailLb sizeToFit];
    [self addSubview:self.detailLb];
    
    
    [self.detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.left.equalTo(self.titleLb.mas_right);
        make.centerY.equalTo(self.titleLb);
        make.right.equalTo(self).with.offset(-1);
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        make.right.equalTo(self.detailLb.mas_left);
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

- (void)setTitle:(NSAttributedString *)title {
    
    _title = title;
    self.titleLb.attributedText = title;
}

- (void)setDetail:(NSAttributedString *)detail {
    
    _detail = detail;
    self.detailLb.attributedText = detail;
    
    self.height = [self.detailLb sizeThatFits:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)].height;
}

- (void)setText:(NSAttributedString *)text {
    
    _text = text;
    self.titleLb.attributedText = text;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
