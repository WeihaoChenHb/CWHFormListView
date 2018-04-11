//
//  FromTableView.h
//  ProcessFormDemo
//
//  Created by weihao on 2018/2/28.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FromTableView : UIView

@property (nonatomic ,strong)NSString *hostAndPort;

- (instancetype)initWithFrame:(CGRect)fram Json:(id)Json dic:(NSDictionary *)dic;

@end
