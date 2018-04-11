//
//  CWHFormCutCollectionViewCell.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormCutCollectionViewCell.h"
#import "Masonry.h"

@implementation CWHFormCutCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *view = [[UIView alloc] init];
        [self.contentView addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}

@end
