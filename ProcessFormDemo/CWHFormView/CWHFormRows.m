//
//  CWHFormRows.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormRows.h"

@implementation CWHFormRows

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.isCutLine = NO;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    
    CWHFormRows *row = [[[self class] allocWithZone:zone] init];
    row.backColor = [self.backColor mutableCopy];
    row.titleColor = [self.titleColor mutableCopy];
    row.detailColor = [self.detailColor mutableCopy];
    row.title = [self.title mutableCopy];
    row.keyPath = [self.keyPath mutableCopy];
    row.linkPath = [self.linkPath mutableCopy];
    row.detail = [self.detail mutableCopy];
    row.size = self.size;
    row.isCutLine = self.isCutLine;
    row.rowHeight = self.rowHeight;
    row.leadMargin = self.leadMargin;
    row.topMargin = self.topMargin;
    row.trailMargin = self.trailMargin;
    row.bottomMargin = self.bottomMargin;
    
    row.useSize = self.useSize;
    row.attStr = [self.attStr mutableCopy];
    return row;
}

@end
