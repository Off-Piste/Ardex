//
//  ADXTableView.m
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

#import "ADXTableView.h"

@implementation ADXTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.adxDatasource).numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.adxDatasource numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ADXTableViewCell *cell;
    if ([(self.adxDatasource) tableViewCellClassForIndexPath:indexPath]) {
        ADXTableViewCell *class = [(self.adxDatasource) tableViewCellClassForIndexPath:indexPath];
        NSString *reuseID = [[class class] reuseID];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
        
    } else if ((self.adxDatasource).tableCellClasses.firstObject) {
        ADXTableViewCell *classes = (self.adxDatasource).tableCellClasses.firstObject;
        NSString *reuseID = [[classes class] reuseID];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
        
    } else if ((self.adxDatasource).tableCellClasses.count > indexPath.section) {
        ADXTableViewCell *classes = (self.adxDatasource).tableCellClasses[indexPath.section];
        NSString *reuseID = [[classes class] reuseID];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
        
    } else {
        UITableViewCell *cell = [UITableViewCell new];
        return cell;
    }
    
    cell.datasourceItem = [self.adxDatasource itemAtIndexPath:indexPath];
    return cell;
}

@end
