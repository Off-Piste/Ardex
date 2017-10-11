//
//  ADXDatasource.m
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import "ADXDatasource.h"
#import "ADXViewable.h"

#import "ADXCollectionViewCell.h"
#import "ADXTableViewCell.h"

#import "ADXAssert.h"

BOOL kADXShouldReloadOnEmpty = NO;

@implementation ADXDatasource {
    id<ADXViewable> _view;
    NSArray *_objects;
}

#pragma mark Properties

- (NSArray *)objects {
    return _objects;
}

- (void)setObjects:(NSArray *)objects {
    if (objects.count == 0) { if (kADXShouldReloadOnEmpty) { [_view reload]; } return; }
    _objects = objects;
    [_view reload];
}

#pragma mark LifeCycle

+ (instancetype)datasourceForView:(id<ADXViewable>)view {
    return [[ADXDatasource alloc] initWithView:view];
}

- (instancetype)initWithView:(id<ADXViewable>)view {
    return [self initWithView:view objects:@[].copy];
}

- (instancetype)initWithView:(id<ADXViewable>)view objects:(NSArray *)objects {
    if (self = [super init]) {
        ADXAssertMainThread();
        ADXAssert(view, @"Cannot create a datasource for a nil view");
        ADXAssert(objects, @"Cannot create a datasource for a nil objects, please use -[initWithView:] instead");

        self->_view = view;
        self->_objects = objects;
    }
    return self;
}

#pragma mark Datasource Methods

- (BOOL)isValid {
    return [_view isKindOfClass:[UICollectionView class]] || [_view isKindOfClass:[UITableView class]];
}

- (NSArray<id> *)cellClasses {
    ADXAssert([self isValid], @"Can only work with UICollectionView or UITableView");

    if ([_view isKindOfClass:[UICollectionView class]]) {
        return @[[ADXCollectionViewCell class]];
    } else if ([_view isKindOfClass:[UITableView class]]) {
        return @[[ADXTableViewCell class]];
    }
    return nil;
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    return self.objects.count;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    ADXAssert([self isValid], @"Can only work with UICollectionView or UITableView");

    if ([_view isKindOfClass:[UICollectionView class]]) {
        return self.objects[indexPath.item];
    } else if ([_view isKindOfClass:[UITableView class]]) {
        return self.objects[indexPath.row];
    }
    return nil;
}

@end
