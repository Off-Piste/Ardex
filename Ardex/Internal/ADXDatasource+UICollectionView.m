//
//  ADXDatasource+UICollectionView.m
//  Ardex
//
//  Created by Harry Wright on 17.10.17.
//

#import "ADXDatasource+UICollectionView.h"
#import "ADXDatasource+ADXListView.h"
#import "ADXDatasourceBase.h"

#import "ADXAssert.h"

@implementation ADXDatasource (UICollectionView)

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self->_base numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    const NSInteger numberOfItems = [self->_base numberOfItemsInSection:section];
    ADXAssert(numberOfItems >= 0, @"Cannot return negative number of items %zi for section %zi",
              numberOfItems, section);
    return numberOfItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *objects = [self->_base objectsForSection:indexPath.section];
    id object = [objects objectAtIndex:indexPath.item];
    
    UICollectionViewCell *cell = [self cellForObject:object atIndexPath:indexPath];
    ADXAssert(cell != nil, @"Returned a nil cell at indexPath <%@>", indexPath);

    return cell;
}

@end
