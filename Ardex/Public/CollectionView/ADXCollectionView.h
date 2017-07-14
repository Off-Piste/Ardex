//
//  ADXCollectionView.h
//  Pods
//
//  Created by Harry Wright on 13.07.17.
//
//

#import <UIKit/UIKit.h>
#import "ADXDatasource.h"

/**
 <#Description#>
 */
NS_SWIFT_NAME(CollectionView)
@interface ADXCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource>

/**
 <#Description#>
 */
@property (weak, nonatomic, nullable) ADXDatasource *adxDatasource;

/**
 <#Description#>
 */
@property (nonatomic) CGFloat cellWidth;

/**
 <#Description#>
 */
@property (nonatomic) CGFloat cellHeight;

@end
