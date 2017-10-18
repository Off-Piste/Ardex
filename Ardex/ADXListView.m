//
//  ADXListView.m
//  Ardex
//
//  Created by Harry Wright on 16.10.17.
//

#import "ADXListView.h"
#import "Internal/ADXListView+DataSource.h"

#import "ADXDatasource.h"
#import "Internal/ADXDatasource+ADXListView.h"

#import "Common/ADXAssert.h"

@implementation ADXListView {
    ADXDatasource *_datasource;
    NSMutableArray *_registeredCells;
}

#pragma mark LifeCycle

/**
 Subclassed these so they don't crash when used like with UICollectionView
 **/

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame collectionViewLayout:[UICollectionViewFlowLayout new]];
}

- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self->_registeredCells = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self->_registeredCells = [NSMutableArray new];
    }
    return self;
}

#pragma mark Properties

- (ADXDatasource *)datasource {
    return _datasource;
}

- (void)setDatasource:(ADXDatasource *)datasource {
    _datasource = datasource;
    _datasource.listView = self;
}

#pragma mark Public API

- (UICollectionViewCell *)dequeueCellClass:(Class)cellClass
                              forIndexPath:(NSIndexPath *)indexPath
{
    ADXParameterAssert(cellClass != nil);
    ADXParameterAssert([indexPath item] >= 0);

    NSString *identifer = NSStringFromClass(cellClass);
    if (![_registeredCells containsObject:cellClass]) {
        [_registeredCells addObject:cellClass];
        [self registerClass:cellClass forCellWithReuseIdentifier:identifer];
    }
    return [super dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
}

- (UICollectionViewCell *)dequeueCellWithIdentifier:(NSString *)identifer
                                       forIndexPath:(NSIndexPath *)indexPath
{
    ADXParameterAssert(identifer.length > 0);
    return [super dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
}

#pragma mark Internal API

- (void)superSetDataSource:(id<UICollectionViewDataSource>)dataSource {
    [super setDataSource:dataSource];
}

@end
