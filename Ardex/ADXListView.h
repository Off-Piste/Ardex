//
//  ADXListView.h
//  Ardex
//
//  Created by Harry Wright on 16.10.17.
//

#import <UIKit/UIKit.h>

#import "ADXMacros.h"

@class ADXDatasource;

NS_ASSUME_NONNULL_BEGIN

/**
 <#Description#>
 */
ADX_SWIFT_NAME(ListView)
@interface ADXListView : UICollectionView

/**
 The datasoucrce for the list view
 */
@property (strong, nullable) ADXDatasource *datasource;

/**
 Method to deqeue the cells, please call this and not ->
 -[dequeueReusableCellWithReuseIdentifier:forIndexPath:]

 @param cellClass   The class for the cell
 @param indexPath   The cells IndexPath
 @return            A UICollectionViewCell
 */
- (__kindof UICollectionViewCell *)dequeueCellClass:(Class)cellClass
                                       forIndexPath:(NSIndexPath *)indexPath;

/**
 Method to deqeue the cells, please call this and not ->
 -[dequeueReusableCellWithReuseIdentifier:forIndexPath:]

 @param identifer   The Cells storyboard identifier.
 @param indexPath   The cells IndexPath
 @return            A UICollectionViewCell
 */
- (__kindof UICollectionViewCell *)dequeueCellWithIdentifier:(NSString *)identifer
                                                forIndexPath:(NSIndexPath *)indexPath;

// MARK: - NS_UNAVAILABLE
- (nullable id<UICollectionViewDataSource>)dataSource NS_UNAVAILABLE;
- (void)setDataSource:(nullable id<UICollectionViewDataSource>)dataSource NS_UNAVAILABLE;
- (UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath NS_UNAVAILABLE;
//- deq

@end

NS_ASSUME_NONNULL_END
