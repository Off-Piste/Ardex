//
//  ADXCollectionView+FlowDelegate.m
//  Pods
//
//  Created by Harry Wright on 13.07.17.
//
//

#import "ADXCollectionView+FlowLayout.h"

@implementation ADXCollectionView (FlowLayout)

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (![self cellWidth] || ([self cellWidth] == 0.0)) {
        [NSException raise:NSRangeException format:@"Cell width must be set or greater than 0"];
    }
    
    if (![self cellHeight] || ([self cellHeight] == 0.0)) {
        [NSException raise:NSRangeException format:@"Cell height must be set or greater than 0"];
    }
    
    return CGSizeMake([self cellWidth], [self cellHeight]);
}

@end
