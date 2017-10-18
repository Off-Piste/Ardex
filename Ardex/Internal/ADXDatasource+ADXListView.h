//
//  ADXDatasource+ADXListView.h
//  Ardex
//
//  Created by Harry Wright on 17.10.17.
//

#import "ADXDatasource.h"

@interface ADXDatasource () {
@protected
    ADXDatasourceBase *_base;
}

/**
 The ListView for the datasource, this is the internal setter.
 */
@property (weak, nullable, readwrite) ADXListView *listView;

@end
