//
//  ADXCollectionViewController.m
//  Ardex
//
//  Created by Harry Wright on 11.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import "ADXCollectionViewController.h"

@interface ADXCollectionViewController ()

@end

@implementation ADXCollectionViewController

- (UIRefreshControl *)refreshControl {
    UIRefreshControl *control = [[UIRefreshControl alloc] init];
    control.tintColor = [UIColor lightGrayColor];
    [control addTarget:self
                action:@selector(refreshOptions)
      forControlEvents:UIControlEventValueChanged];
    
    return control;
}

- (void)refreshOptions {
    return;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.alwaysBounceVertical = YES;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.datasource numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.datasource numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __block ADXCollectionViewCell *cell;
    if ([self.datasource cellClasses].firstObject) {
        ADXCollectionViewCell *classes = (ADXCollectionViewCell *) [self.datasource cellClasses].firstObject;
        NSString *reuseID = [classes reuseID];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID
                                                         forIndexPath:indexPath];
    } else if ([self.datasource cellClasses].count > indexPath.section) {
        ADXCollectionViewCell *classes = (ADXCollectionViewCell *) [self.datasource cellClasses][indexPath.section];
        NSString *reuseID = [classes reuseID];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID
                                                         forIndexPath:indexPath];
    } else {
        UICollectionViewCell *cell = [UICollectionViewCell init];
        return cell;
    }
    
    [cell setDatasourceItem:[_datasource itemAtIndexPath:indexPath]];
    return cell;
}

@end
