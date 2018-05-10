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
#import "CWHFormCollectionReusableView.h"
#import "UIColor+moreColor.h"

static NSString *const formCellID = @"CWHFormCollectionViewCell";
static NSString *const reusableViewID = @"CWHFormCollectionReusableView";

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

- (void)setupCollectionView {
    
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    
    [self addSubview:_collectionView];
    
    [_collectionView registerClass:[CWHFormCollectionViewCell class] forCellWithReuseIdentifier:formCellID];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    [_collectionView registerClass:[CWHFormCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reusableViewID];
    
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
  
    if (row.isCutLine) {
        
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
        
        return cell;
        
    } else {
        
        CWHFormCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:formCellID forIndexPath:indexPath];
        
        cell.row = row;

        return cell;
    }
}

// 组头和组尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        CWHFormSections *section = self.dataSource.model.sections[indexPath.section];
        CWHFormCollectionReusableView *head = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reusableViewID forIndexPath:indexPath];
        
        head.title = section.title;
        head.titleColor = [UIColor colorWithHexColorString:section.textColor];
        head.backgroundColor = [UIColor colorWithHexColorString:section.backColor];
        
        return head;
     
    }
    else
    {
        return nil;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CWHFormSections *section = self.dataSource.model.sections[indexPath.section];
    CWHFormRows *row = section.rows[indexPath.row];
    NSLog(@"%f--%f",row.useSize.width,row.useSize.height);
    return row.useSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CWHFormSections *sections = self.dataSource.model.sections[section];
    
    return CGSizeMake(self.bounds.size.width, sections.height);
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
