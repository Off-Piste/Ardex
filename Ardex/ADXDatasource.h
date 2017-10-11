//
//  ADXDatasource.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import <Foundation/Foundation.h>
#import "ADXMacros.h"

@protocol ADXViewable;

NS_ASSUME_NONNULL_BEGIN

/**
 @note - If you are wanting to use a SwiftsSubclass in an Objective-C class,
 make sure you call `[[... alloc]initWithView:]` or `[[... alloc]initWithView:objects:]`
 otherwise your class will never get called.
 */
ADX_CLASS(Datasource, NSObject)

@property (strong, nonnull) NSArray *objects;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)datasourceForView:(nullable id<ADXViewable>)view NS_SWIFT_UNAVAILABLE("Please use `init(view:objects:)`");

- (instancetype)initWithView:(nullable id<ADXViewable>)view;

- (instancetype)initWithView:(nullable id<ADXViewable>)view objects:(NSArray *)objects;

- (NSArray<id> *)cellClasses;

- (nullable id)cellClassForIndexPath:(NSIndexPath *)indexPath NS_SWIFT_NAME(cellClass(for:));

- (NSInteger)numberOfSections;

- (NSInteger)numberOfItemsInSection:(NSInteger)section NS_SWIFT_NAME(numberOfItems(in:));

- (nullable id)itemAtIndexPath:(NSIndexPath *)indexPath NS_SWIFT_NAME(item(at:));

@end

NS_ASSUME_NONNULL_END
