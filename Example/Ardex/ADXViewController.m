//
//  ADXViewController.m
//  Ardex
//
//  Created by harrytwright on 07/12/2017.
//  Copyright (c) 2017 harrytwright. All rights reserved.
//

#import "ADXViewController.h"

#import "Ardex_Example-Bridging-Header.h"

#import "Ardex_Example-Swift.h"

@interface ADXViewController ()

@end

@implementation ADXViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasource = [[DS alloc] initWithView:self.collectionView];
    self.datasource.objects = @[@1, @5, @100, @88, @200];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, 50);
}

@end

