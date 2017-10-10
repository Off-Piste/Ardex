//
//  ADXCollectionViewController.m
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import "ADXCollectionViewController.h"
#import "ADXCollectionViewCell.h"
#import "ADXDatasource.h"

@import ObjectiveC;

@interface UICollectionView (ADX)

- (__kindof UICollectionViewCell *)dequeueReusableCell:(__kindof ADXCollectionViewCell *)cell
                                 forIndexPath:(NSIndexPath *)indexPath;

@end

@implementation UICollectionView (ADX)

- (UICollectionViewCell *)dequeueReusableCell:(ADXCollectionViewCell *)cell
                                 forIndexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithReuseIdentifier: [[cell class] reuseID]
                                           forIndexPath:indexPath];
}

@end

@interface ADXCollectionViewController ()

@end

@implementation ADXCollectionViewController

- (void)refreshOptions { }

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.alwaysBounceVertical = YES;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.datasource numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [self.datasource numberOfItemsInSection:section];
}

/**
 The middle statment on this is a slight pain, comming from
 Swift we could do [ArrayObject.Type] which would technically pass
 [Class] but Swift knows the type and can allow you to access the
 +[reuseId] method but with Obj-C you can't :/
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ADXCollectionViewCell *_Nonnull cell;

    ADXCollectionViewCell *_Nonnull _class;
    if ((_class = [self.datasource cellClassForIndexPath:indexPath])) {
        cell = [collectionView dequeueReusableCell:_class forIndexPath:indexPath];
    } else if ((_class = [self.datasource cellClasses].firstObject)) {
        cell = [collectionView dequeueReusableCell:_class forIndexPath:indexPath];
    } else if ([self.datasource cellClasses] && [self.datasource cellClasses].count > indexPath.section) {
        _class = [self.datasource cellClasses][indexPath.section];
        cell = [collectionView dequeueReusableCell:_class forIndexPath:indexPath];
    } else {
        return [UICollectionViewCell new];
    }

    cell.datasourceItem = [self.datasource itemAtIndexPath:indexPath];
    return cell;
}



@end
