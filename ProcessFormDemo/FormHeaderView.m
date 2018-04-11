//
//  FormHeaderView.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/3.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormHeaderView.h"
#import "Masonry.h"
#import "UIColor+moreColor.h"

@interface FormHeaderView ()

@property (nonatomic ,strong)UILabel *headerLb;

@property (nonatomic ,strong)UILabel *detailLb;

@property (nonatomic ,strong)UIButton *arrowBtn;

@end

@implementation FormHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    _headerLb = [[UILabel alloc] init];
    [self.contentView addSubview:_headerLb];
    
    [_headerLb mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
    }];
    
    _detailLb = [[UILabel alloc] init];
    _detailLb.hidden = YES;
    [self.contentView addSubview:_detailLb];
    
    [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_headerLb.mas_right);
        make.centerY.equalTo(_headerLb);
    }];
    
    _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_arrowBtn];
    
    [_arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(self);
    }];
}

- (void)setBackColor:(NSString *)backColor {
    
    _backColor = backColor;
    self.contentView.backgroundColor = [UIColor colorWithHexColorString:backColor];
}

- (void)setHeaderText:(NSString *)headerText {
    
    _headerText = headerText;
    _headerLb.text = headerText;
}

- (void)setHeaderFont:(NSInteger)headerFont {
    
    _headerFont = headerFont;
    _headerLb.font = [UIFont systemFontOfSize:headerFont];
}

- (void)setHeaderColor:(NSString *)headerColor {
    
    _headerColor = headerColor;
    _headerLb.textColor = [UIColor colorWithHexColorString:headerColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
