//
//  Datasource.h
//  Ardex
//
//  Created by Harry Wright on 11.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADXCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef Class CellClass;

/**
 <#Description#>
 */
NS_SWIFT_NAME(Datasource)
@interface ADXDatasource : NSObject

@property (strong, nullable) UITableView *tableView;

@property (strong, nullable) UICollectionView *collectionView;

@property (strong, nonatomic) NSArray<id> *objects;

#pragma mark - Init

- (instancetype)initWithTableView:(UITableView * _Nullable)tableView;

- (instancetype)initWithTableView:(UITableView * _Nullable)tableView
                          objects:(NSArray<id> *)objects;

- (instancetype)initWithCollectionView:(UICollectionView * _Nullable)collectionView;

- (instancetype)initWithCollectionView:(UICollectionView * _Nullable)collectionView
                               objects:(NSArray<id> *)objects;

#pragma mark - Setters

- (void)setObjects:(NSArray<id> * _Nonnull)objects;

#pragma mark - Datasource Methods

- (long)numberOfSections;

- (long)numberOfItemsInSection:(long)section NS_SWIFT_NAME(numberOfItems(in:));

- (id)itemAtIndexPath:(NSIndexPath *)indexPath NS_SWIFT_NAME(item(at:));

- (NSArray<CellClass> * _Nonnull)cellClasses;

@end

NS_ASSUME_NONNULL_END
