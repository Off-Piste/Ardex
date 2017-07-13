//
//  ADXCollectionView.m
//  Pods
//
//  Created by Harry Wright on 13.07.17.
//
//

#import "ADXCollectionView.h"

@implementation ADXCollectionView

- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.adxDatasource numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.adxDatasource numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __block ADXCollectionViewCell *cell;
    if ([self.adxDatasource collectionCellClasses].firstObject) {
        ADXCollectionViewCell *classes = (ADXCollectionViewCell *) [self.adxDatasource collectionCellClasses].firstObject;
        NSString *reuseID = [classes reuseID];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID
                                                         forIndexPath:indexPath];
    } else if ([self.adxDatasource collectionCellClasses].count > indexPath.section) {
        ADXCollectionViewCell *classes = (ADXCollectionViewCell *) [self.adxDatasource collectionCellClasses][indexPath.section];
        NSString *reuseID = [classes reuseID];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID
                                                         forIndexPath:indexPath];
    } else {
        UICollectionViewCell *cell = [UICollectionViewCell init];
        return cell;
    }
    
    [cell setDatasourceItem:[self.adxDatasource itemAtIndexPath:indexPath]];
    return cell;
}

@end
