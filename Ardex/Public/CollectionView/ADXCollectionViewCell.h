//
//  ADXCollectionViewCell.h
//  Ardex
//
//  Created by Harry Wright on 12.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 <#Description#>
 */
NS_SWIFT_NAME(CollectionViewCell)
@interface ADXCollectionViewCell : UICollectionViewCell

/** 
 The datasource item that is set to the cell, currently set as `id` so will 
 need to be casted to required model, also calls the `configCell()` 
 method upon setting.
 */
@property (strong, nullable, nonatomic) id datasourceItem;

/**
 The cells reuse identifier, override this is you want a custom
 identifier.

 @return The cells reuse identifier.
 */
+ (NSString*)reuseID;

/**
 Override me and place all your programatical view elements in here!
 */
- (void)configureCell;

/**
 Override me and use me to change elements
 */
- (void)setupViews;

@end

NS_ASSUME_NONNULL_END
