//
//  CWHFormDateSource.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWHFormModel.h"

@interface CWHFormDataSource : NSObject

@property (nonatomic ,strong)CWHFormModel *model;

- (instancetype)initWithFrame:(CGRect)frame Json:(id)Json resource:(id)resource;

@end
