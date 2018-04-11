//
//  FromSingleTableViewCell.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/2.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormSingleTableViewCell.h"
#import "DetailLabelView.h"
#import "Masonry.h"
#import "ProcessModel.h"
#import "UIColor+moreColor.h"

@interface FormSingleTableViewCell ()

@property (nonatomic ,strong)DetailLabelView *labelView;

@end

@implementation FormSingleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    self.labelView = [[DetailLabelView alloc] init];
    
    [self.contentView addSubview:self.labelView];
    
    [self.labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(10);
    }];
    
}

- (void)setRow:(FormRows *)row {
    
    _row = row;
    
    NSArray *arr = @[self.labelView];
    
    __block CGFloat height = 0;
    
    [row.modules enumerateObjectsUsingBlock:^(FormModules *module, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DetailLabelView *labelView = arr[idx];
        labelView.title = module.title;
        labelView.detail = module.detail;
        labelView.titleTextColor = [UIColor colorWithHexColorString:module.titleColor];
        labelView.detailTextColor = [UIColor colorWithHexColorString:module.detailColor];
        height = labelView.height;
        
    }];
    
    _row.rowHeight = height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
