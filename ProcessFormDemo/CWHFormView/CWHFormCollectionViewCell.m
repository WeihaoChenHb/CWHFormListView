//
//  CWHFormCollectionViewCell.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormCollectionViewCell.h"
#import "DetailLabelView.h"
#import "Masonry.h"
#import "CWHFormRows.h"
#import "UIColor+moreColor.h"

@interface CWHFormCollectionViewCell ()

@property (nonatomic ,strong)DetailLabelView *labelView;

@end

@implementation CWHFormCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
      
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    self.labelView = [[DetailLabelView alloc] init];
    
    [self.contentView addSubview:self.labelView];
    
    [self.labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}

- (void)setRow:(CWHFormRows *)row {
    
    _row = row;
    self.contentView.backgroundColor = [UIColor colorWithHexColorString:row.backColor];
//    self.labelView.title = row.title;
//    self.labelView.detail = row.detail;
//    self.labelView.titleTextColor = [UIColor colorWithHexColorString:row.titleColor];
//    self.labelView.detailTextColor = [UIColor colorWithHexColorString:row.detailColor];
    self.labelView.text = row.attStr;
//    _row.rowHeight = self.labelView.height;
}

@end
