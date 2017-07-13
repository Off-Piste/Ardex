//
//  UICollectionView+Registerable.h
//  Pods
//
//  Created by Harry Wright on 13.07.17.
//
//

#import <UIKit/UIKit.h>
#import "ADXCollectionViewCell.h"

@interface UICollectionView (Registerable)

- (void)registerClass:(ADXCollectionViewCell *)cellClass;

@end
