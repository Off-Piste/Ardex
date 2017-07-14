//
//  Datasource.h
//  Ardex
//
//  Created by Harry Wright on 11.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADXCollectionViewCell.h"
#import "ADXBasicCollectionCell.h"
#import "ADXTableViewCell.h"
#import "ADXTableViewBasicCell.h"

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

/**
 <#Description#>
 */
NS_SWIFT_NAME(Datasource)
@interface ADXDatasource : NSObject

/**
 <#Description#>
 */
@property (strong, nullable) UITableView *tableView;

/**
 <#Description#>
 */
@property (strong, nullable) UICollectionView *collectionView;

/**
 <#Description#>
 */
@property (strong, nonatomic) NSArray<id> *objects;

#pragma mark - Init

/**
 <#Description#>

 @param tableView <#tableView description#>
 @return <#return value description#>
 */
- (instancetype)initWithTableView:(UITableView * _Nullable)tableView;

/**
 <#Description#>

 @param tableView <#tableView description#>
 @param objects <#objects description#>
 @return <#return value description#>
 */
- (instancetype)initWithTableView:(UITableView * _Nullable)tableView
                          objects:(NSArray<id> *)objects;

/**
 <#Description#>

 @param collectionView <#collectionView description#>
 @return <#return value description#>
 */
- (instancetype)initWithCollectionView:(UICollectionView * _Nullable)collectionView;

/**
 <#Description#>

 @param collectionView <#collectionView description#>
 @param objects <#objects description#>
 @return <#return value description#>
 */
- (instancetype)initWithCollectionView:(UICollectionView * _Nullable)collectionView
                               objects:(NSArray<id> *)objects;

#pragma mark - Setters

- (void)setObjects:(NSArray<id> * _Nonnull)objects;

#pragma mark - Datasource Methods

/**
 <#Description#>
 */
@property (NS_NONATOMIC_IOSONLY, readonly) long numberOfSections;

/**
 <#Description#>

 @param section <#section description#>
 @return <#return value description#>
 */
- (long)numberOfItemsInSection:(long)section NS_SWIFT_NAME(numberOfItems(in:));

/**
 <#Description#>

 @param indexPath <#indexPath description#>
 @return <#return value description#>
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath NS_SWIFT_NAME(item(at:));

/**
 <#Description#>
 */
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray<id> *collectionCellClasses;

/**
 <#Description#>

 @param indexPath <#indexPath description#>
 @return <#return value description#>
 */
- (ADXCollectionViewCell * _Nullable)collectionCellClassForIndexPath:(NSIndexPath *)indexPath;

/**
 <#Description#>
 */
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray<id> *tableCellClasses;

/**
 <#Description#>

 @param indexPath <#indexPath description#>
 @return <#return value description#>
 */
- (ADXTableViewCell * _Nullable)tableViewCellClassForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
