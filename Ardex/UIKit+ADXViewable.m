//
//  UICollectionViewController+ADXViewable.m
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import "UIKit+ADXViewable.h"

@implementation UICollectionView (ADXViewable)

- (void)reload {
    [self reloadData];
}

@end

@implementation UITableView (ADXViewable)

- (void)reload {
    [self reloadData];
}

@end
