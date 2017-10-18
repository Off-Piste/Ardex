//
//  ADXDatasource.m
//  Ardex
//
//  Created by Harry Wright on 16.10.17.
//

#import "ADXDatasource.h"
#import "Internal/ADXDatasource+ADXListView.h"
#import "Internal/ADXDatasourceBase.h"
#import "Internal/ADXDatasource+UICollectionView.h"

#import "ADXListView.h"
#import "Internal/ADXListView+DataSource.h"

//@interface ADXDatasource ()
//
//@end

@implementation ADXDatasource {
    id _queue_objects;
    __weak ADXListView *_listView;
}

#pragma mark LifeCycle

- (instancetype)init {
    return [self initWithObjects:@[].copy];
}

- (instancetype)initWithObjects:(id)objects {
    if (self = [super init]) {
        self->_base = [ADXDatasourceBase new];
        self->_queue_objects = objects;

        [self publicSettingChanged];
    }
    return self;
}

#pragma mark Properties

- (ADXListView *)listView {
    return _listView;
}

- (void)setListView:(ADXListView * _Nullable)listView {
    _listView = listView;

    [_listView superSetDataSource:self];
    [_listView setDelegate:self];
    [self publicSettingChanged];
}

- (id)objects {
    return self->_base.objects;
}

- (void)setObjects:(id)objects {
    _queue_objects = objects;

    [self publicSettingChanged];
}

#pragma mark PublicAPI

- (UICollectionViewCell *)cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.listView dequeueCellClass:[UICollectionViewCell class]
                                                    forIndexPath:indexPath];
#ifdef DEBUG
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = [UIColor darkGrayColor];
    }
#endif //DEBUG
    return cell;
}

#pragma mark PrivateAPI

- (void)publicSettingChanged {
    if (_queue_objects != nil && self.listView != nil) {
        self->_base.objects = _queue_objects;
        [self.listView reloadData];
    }
}

@end
