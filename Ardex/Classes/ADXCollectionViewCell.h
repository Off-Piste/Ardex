//
//  ADXCollectionViewCell.h
//  Ardex
//
//  Created by Harry Wright on 12.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_SWIFT_NAME(CollectionViewCell)
@interface ADXCollectionViewCell : UICollectionViewCell

@property (strong, nullable, nonatomic) id datasourceItem;

+ (NSString * _Nonnull)reuseID;

- (NSString * _Nonnull)reuseID;

- (void)configureCell;

- (void)setupViews;

@end
