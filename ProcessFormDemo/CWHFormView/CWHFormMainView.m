//
//  CWHFormMainView.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/4/8.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "CWHFormMainView.h"
#import "CWHFormCollectionViewCell.h"
#import "CWHFormDataSource.h"
#import "NSDictionary+SafeValue.h"

static NSString *const formCellID = @"CWHFormCollectionViewCell";

@interface CWHFormMainView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic ,strong)UICollectionView *collectionView;

@property (nonatomic ,strong)UICollectionViewFlowLayout *flowLayout;

@property (nonatomic ,strong)id Json;

@property (nonatomic ,strong)id resource;

@property (nonatomic ,strong)CWHFormDataSource *dataSource;

@property (nonatomic ,strong)NSMutableArray *rowHeights;

@end

@implementation CWHFormMainView

- (instancetype)initWithFrame:(CGRect)frame Json:(id)Json resourceModel:(id)resourceModel {
    
    if (self = [super initWithFrame:frame]) {
        
        _Json = Json;
        _resource = resourceModel;

        _dataSource = [[CWHFormDataSource alloc] initWithFrame:self.bounds Json:_Json resource:_resource];
        for (int i = 0; i < _dataSource.model.sections.count; i++) {
            
            [self.rowHeights addObject:[NSMutableArray new]];
        }
        [self setupCollectionView];
        
    }
    return self;
}

- (NSMutableArray *)rowHeights {
    
    if (!_rowHeights) {
        _rowHeights = [NSMutableArray new];
    }
    return _rowHeights;
}

- (void)addHeightWith:(CGFloat)height indexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *heights = self.rowHeights[indexPath.section];
    CWHFormSections *section = self.dataSource.model.sections[indexPath.section];
//    if (heights.count == section.rows.count) {
//        return;
//    }
    
    if (heights.count  > indexPath.row) {
        [heights replaceObjectAtIndex:indexPath.row withObject:@(height)];
    } else {
        
        [heights addObject:@(height)];
    }
    
    if (heights.count == section.rows.count) {
        [self.collectionView reloadData];
    }
    
}

- (void)setupCollectionView {
    
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_collectionView];
    
    [_collectionView registerClass:[CWHFormCollectionViewCell class] forCellWithReuseIdentifier:formCellID];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return _dataSource.model.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    CWHFormSections *sections = (CWHFormSections *)_dataSource.model.sections[section];
    return sections.rows.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CWHFormSections *section = self.dataSource.model.sections[indexPath.section];
    CWHFormRows *row = section.rows[indexPath.row];
    CGSize size = [self collectionView:collectionView layout:_flowLayout sizeForItemAtIndexPath:indexPath];
    if (row.isCutLine) {
        
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
        
//        [self addHeightWith:0.5 indexPath:indexPath];
        row.rowHeight = 0.5;
        
        if (size.height != row.rowHeight) {
            
            [collectionView reloadItemsAtIndexPaths:@[indexPath]];
        }
        
        return cell;
        
    } else {
        
        CWHFormCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:formCellID forIndexPath:indexPath];
        
        cell.row = row;
        
        if (size.height != row.rowHeight) {
            
            [collectionView reloadItemsAtIndexPaths:@[indexPath]];
        }
//        [self addHeightWith:row.rowHeight indexPath:indexPath];
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CWHFormSections *section = self.dataSource.model.sections[indexPath.section];
    CWHFormRows *row = section.rows[indexPath.row];
    CGFloat width = [[row.size safe_valueForKey:@"width"] floatValue] / 100 * self.bounds.size.width;
    
    return row.useSize;
}

// 设置组和item之间的间隔
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
