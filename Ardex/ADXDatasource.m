//
//  Datasource.m
//  Ardex
//
//  Created by Harry Wright on 11.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import "ADXDatasource.h"

@implementation ADXDatasource

- (void)setObjects:(NSArray<id> *)objects {
    if (objects.count == 0) {
        NSLog(@"[Ardex] Objects passed though (%s) were empty", __PRETTY_FUNCTION__);
        return;
    }
    
    self->_objects = objects;
    [self reload];
}

- (instancetype)init {
    [NSException raise:NSGenericException
            format:@"Please use `initWithTableView:` "
                   @"or `initWithCollectionView:` instead"];
    
    return nil;
}

- (instancetype)initWithTableView:(UITableView *)tableView {
    return [self initWithTableView:tableView objects:@[]];
}

- (instancetype)initWithTableView:(UITableView *)tableView
                          objects:(NSArray<id> *)objects {
    if (self.collectionView) {
        [NSException raise:NSInvalidArgumentException format:@""];
    }
    
    self->_tableView = tableView;
    self->_objects = objects;
    return self;
}

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView {
    return [self initWithCollectionView:collectionView objects:@[]];
}

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                               objects:(NSArray<id> *)objects {
    if (self.tableView) {
        [NSException raise:NSInvalidArgumentException format:@""];
    }
    
    self->_collectionView = collectionView;
    self->_objects = objects;
    return self;
}

- (long)numberOfSections {
    return 1;
}

- (long)numberOfItemsInSection:(long)section {
    return (long) self.objects.count;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.collectionView) {
        return self.objects[indexPath.item];
    } else if (self.tableView) {
        return self.objects[indexPath.row];
    } else {
        [NSException raise:NSGenericException format:@""];
        return nil;
    }
}

- (NSArray<id> *)collectionCellClasses {
    return @[[ADXBasicCollectionCell copy]];
}

- (NSArray<id> *)tableCellClasses {
    return @[[ADXTableViewBasicCell copy]];
}

- (ADXCollectionViewCell *)collectionCellClassForIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (ADXTableViewCell *)tableViewCellClassForIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)reload {
    if (self.tableView) {
        [self.tableView reloadData];
    } else if (self.collectionView) {
        [self.collectionView reloadData];
    } else {
        [NSException raise:NSGenericException
                    format:@"The UITableView or UICollectionView needs to "
                           @"be set before the objects"];
    }
}

@end
