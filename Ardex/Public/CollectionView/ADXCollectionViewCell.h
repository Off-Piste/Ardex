//
//  ADXCollectionViewCell.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import <UIKit/UIKit.h>

@interface ADXCollectionViewCell : UICollectionViewCell

@property (strong, nullable) id datasourceItem;

+ (NSString *_Nonnull)reuseID;

- (void)configureCell;

- (void)setupViews;

@end
