//
//  FormDoubleTableViewCell.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/2.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FormDoubleTableViewCell.h"
#import "DetailLabelView.h"
#import "Masonry.h"
#import "ProcessModel.h"
#import "UIColor+moreColor.h"

@interface FormDoubleTableViewCell ()

@property (nonatomic ,strong)DetailLabelView *leftLabel;

@property (nonatomic ,strong)DetailLabelView *rightLabel;

@end

@implementation FormDoubleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }
    
    return self;
}

- (void)createUI {
    
    self.leftLabel = [[DetailLabelView alloc] init];
    [self.contentView addSubview:self.leftLabel];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.right.equalTo(self.mas_centerX).with.offset(-10);
    }];
    
    self.rightLabel = [[DetailLabelView alloc] init];
    
    [self.contentView addSubview:self.rightLabel];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_centerX).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
    }];
}

- (void)setRow:(FormRows *)row {
    
    _row = row;
    
    NSArray *arr = @[self.leftLabel,self.rightLabel];
    __block CGFloat height = 0;
    
    [row.modules enumerateObjectsUsingBlock:^(FormModules *module, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DetailLabelView *labelView = arr[idx];
        labelView.title = module.title;
        labelView.detail = module.detail;
        labelView.titleTextColor = [UIColor colorWithHexColorString:module.titleColor];
        labelView.detailTextColor = [UIColor colorWithHexColorString:module.detailColor];
        
        height = height > labelView.height ? height : labelView.height;
        
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
