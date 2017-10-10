//
//  ADXDatasource.m
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import "ADXDatasource.h"
#import "ADXViewable.h"

#import "ADXCollectionViewCell.h"

@implementation ADXDatasource {
    id<ADXViewable> _view;
    NSArray *_objects;
}

#pragma mark Properties

- (NSArray *)objects {
    return _objects;
}

- (void)setObjects:(NSArray *)objects {
    if (objects.count == 0) { return; }
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
        NSAssert(view, @"Cannot create a datasource for a nil view");
        self->_view = view;
        self->_objects = objects;
    }
    return self;
}

#pragma mark Datasource Methods

- (NSArray<id> *)cellClasses {
    if ([_view isKindOfClass:[UICollectionView class]]) {
        return @[[ADXCollectionViewCell class]];
    } else if ([_view isKindOfClass:[UITableView class]]) {
        // TODO: ...
        return nil;
    } else {
        [NSException raise:NSGenericException format:@""];
        return nil;
    }
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
    if ([_view isKindOfClass:[UICollectionView class]]) {
        return _objects[indexPath.item];
    } else if ([_view isKindOfClass:[UITableView class]]) {
        return _objects[indexPath.row];
    } else {
        [NSException raise:NSGenericException format:@""];
        return nil;
    }
}

@end
