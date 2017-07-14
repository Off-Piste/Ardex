//
//  ADXViewController.m
//  Ardex
//
//  Created by harrytwright on 07/12/2017.
//  Copyright (c) 2017 harrytwright. All rights reserved.
//

#import "ADXViewController.h"

@interface ADXViewController ()

@end

@implementation ADXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasource = [[ADXDatasource alloc] initWithCollectionView:self.collectionView];
    (self.datasource).objects = @[];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, 50);
}

@end
