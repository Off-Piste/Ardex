//
//  ADXCollectionView.h
//  Pods
//
//  Created by Harry Wright on 13.07.17.
//
//

#import <UIKit/UIKit.h>
#import "ADXDatasource.h"

NS_SWIFT_NAME(CollectionView)
@interface ADXCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic, nullable) ADXDatasource *adxDatasource;

@property (nonatomic) CGFloat cellWidth;

@property (nonatomic) CGFloat cellHeight;

@end
