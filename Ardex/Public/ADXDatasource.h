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
#import "ADXBasicCollectionCell.h"
#import "ADXTableViewCell.h"
#import "ADXTableViewBasicCell.h"
#import <asl.h>

NS_ASSUME_NONNULL_BEGIN

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

@property (NS_NONATOMIC_IOSONLY, readonly) long numberOfSections;

- (long)numberOfItemsInSection:(long)section NS_SWIFT_NAME(numberOfItems(in:));

- (id)itemAtIndexPath:(NSIndexPath *)indexPath NS_SWIFT_NAME(item(at:));

@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray<id> *collectionCellClasses;

- (ADXCollectionViewCell * _Nullable)collectionCellClassForIndexPath:(NSIndexPath *)indexPath;

@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray<id> *tableCellClasses;

- (ADXTableViewCell * _Nullable)tableViewCellClassForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
