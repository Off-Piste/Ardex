//
//  ADXDatasource.h
//  Ardex
//
//  Created by Harry Wright on 16.10.17.
//

#import <Foundation/Foundation.h>

#import "ADXMacros.h"

@class ADXListView;
@class ADXDatasourceBase;

NS_ASSUME_NONNULL_BEGIN

/**
 <#Description#>
 */
ADX_SWIFT_NAME(Datasource)
@interface ADXDatasource : NSObject 

/**
 The ListView for the datasource
 */
@property (weak, nullable, readonly) ADXListView *listView;

/**
 The objects for the ListView.

 @note If you set this property the listView will do a full reload.
 */
@property (strong, nonnull) id objects;

/**
 Method to create a new datasource

 @note          If you don't know the objects use -[init] as we
                will pass and empty array for you.
 @param objects The objects for the listView.
 @return        The datasource for the ListView.
 */
- (instancetype)initWithObjects:(id)objects;

/**
 Return a dequeued cell for a given index.

 @note              This method should be overriden and return a custom cell
                    using -[self.listView dequeueCellClass:atIndexPath:].
 @param object      The current object for the cell
 @param indexPath   The indexPath for the cell
 @return            A configured `UICollectionViewCell` subclass.
 */
- (__kindof UICollectionViewCell *)cellForObject:(id)object
                                     atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
