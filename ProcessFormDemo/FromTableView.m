//
//  FromTableView.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/2/28.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "FromTableView.h"
#import "FormDataSource.h"
#import "FormSingleTableViewCell.h"
#import "FormDoubleTableViewCell.h"
#import "FormHeaderView.h"
#import "UIColor+moreColor.h"

static NSString *const singleCellID = @"FormSingleTableViewCell";
static NSString *const doubleCellID = @"FormDoubleTableViewCell";
static NSString *const headerID = @"FormHeaderView";

@interface FromTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *tableView;

@property (nonatomic ,strong)id json;

@property (nonatomic ,strong)FormDataSource *dataSource;

@end

@implementation FromTableView

- (instancetype)initWithFrame:(CGRect)fram Json:(id)Json dic:(NSDictionary *)dic {
    
    if (self = [super initWithFrame:fram]) {
        
        _json = Json;
        
        _dataSource = [[FormDataSource alloc] initWithJSON:Json dic:dic];
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    [self addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_tableView registerClass:[FormSingleTableViewCell class] forCellReuseIdentifier:singleCellID];
    [_tableView registerClass:[FormDoubleTableViewCell class] forCellReuseIdentifier:doubleCellID];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [_tableView registerClass:[FormHeaderView class] forHeaderFooterViewReuseIdentifier:headerID];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _dataSource.model.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    FormSections *sections = _dataSource.model.sections[section];
    return sections.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FormSections *section = self.dataSource.model.sections[indexPath.section];
    FormRows *row = section.rows[indexPath.row];
    
    if (row.isCutLine) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        
        
        return cell;
        
    } else {
        
        if (row.modules.count > 1) {
            
            FormDoubleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:doubleCellID forIndexPath:indexPath];
            cell.row = row;
            cell.backgroundColor = [UIColor colorWithHexColorString:row.backColor];
            return cell;
            
        } else {
            FormSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:singleCellID forIndexPath:indexPath];
            cell.row = row;
            cell.backgroundColor = [UIColor colorWithHexColorString:row.backColor];
            return cell;
        }
        
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    FormSections *sections = self.dataSource.model.sections[section];
    
    FormHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    
    headerView.headerText = sections.title;
    headerView.headerColor = sections.textColor;
    headerView.backColor = sections.backColor;
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FormSections *section = self.dataSource.model.sections[indexPath.section];
    FormRows *row = section.rows[indexPath.row];
    
    if (row.isCutLine) {
        return 5;
    } else {
        
        return row.rowHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 18;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
