//
//  FormDataSource.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/3/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromModel.h"


@interface FormDataSource : NSObject

@property (nonatomic ,strong)FromModel *model;

- (instancetype)initWithJSON:(id)JSON dic:(NSDictionary *)dic;

@end
