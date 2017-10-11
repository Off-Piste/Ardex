//
//  TableViewController.m
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import "ADXTableViewController.h"
#import "ADXTableViewCell.h"

#import "ADXDatasource.h"

@interface UITableView (ADX)

- (__kindof UITableViewCell *)dequeueReusableCell:(__kindof ADXTableViewCell *)cell
                            forIndexPath:(NSIndexPath *)indexPath;

@end

@implementation UITableView (ADX)

- (UITableViewCell *)dequeueReusableCell:(ADXTableViewCell *)cell
                            forIndexPath:(NSIndexPath *)indexPath
{
    return [self dequeueReusableCellWithIdentifier:[[cell class] reuseID]
                                      forIndexPath:indexPath];
}

@end

@implementation ADXTableViewController

- (void)refreshOptions { }

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.alwaysBounceVertical = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.datasource numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.datasource numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ADXTableViewCell *_Nonnull cell;

    ADXTableViewCell *_Nonnull _class;
    if ((_class = [self.datasource cellClassForIndexPath:indexPath])) {
        cell = [tableView dequeueReusableCell:_class forIndexPath:indexPath];
    } else if ((_class = [self.datasource cellClasses].firstObject)) {
        cell = [tableView dequeueReusableCell:_class forIndexPath:indexPath];
    } else if ([self.datasource cellClasses] && [self.datasource cellClasses].count > indexPath.section) {
        _class = [self.datasource cellClasses][indexPath.section];
        cell = [tableView dequeueReusableCell:_class forIndexPath:indexPath];
    } else {
        return [UITableViewCell new];
    }

    cell.datasourceItem = [self.datasource itemAtIndexPath:indexPath];
    return cell;

    return cell;
}

@end
