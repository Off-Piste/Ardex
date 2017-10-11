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

extern BOOL kADXShouldReloadOnEmpty;

/**
 Datasource is the 'sub-classable' class that powers the whole framework.

 All you need is this bad boy and some networking code and you can have a fully
 up and running CollectionView/TableView Application within minutes.

 Simply calling:

 @code
 ...
 self.datasource = [ADXDatasource dadatasourceForView: self.collectionView];
 self.datasource.objects = @[@"Hello", @"World"];
 @endcode

 And bam, you have a running collection view

 @note - If you are wanting to use a Swift Subclass in an Objective-C class,
 make sure you call `-[initWithView:]` or `-[initWithView:objects:]`
 otherwise your class will never get called.
 */
ADX_SWIFT_NAME(Datasource)
@interface ADXDatasource : NSObject

/**
 Objects is the array of the datasource objects you are wishing to show, can be
 anything you wish, as we use a Generic Array
 */
@property (strong, nonnull) NSArray *objects;

/**
 NS_UNAVAILABLE
 */
- (instancetype)init NS_UNAVAILABLE;

/**
 NS_UNAVAILABLE
 */
+ (instancetype)new NS_UNAVAILABLE;

/**
 Method to create a new Datasource

 @note          If you are using a Swift Datasource, please call -[initWithView:]
                instead as the subclass will never get called.
 @param view    The ADXViewable conforming object
 @return        A new ADXDatasource.
 */
+ (instancetype)datasourceForView:(nullable id<ADXViewable>)view NS_SWIFT_UNAVAILABLE("Please use `init(view:objects:)`");

/**
 Method to create a new Datasource

 @note          By defaults passed an empty array of objects.
 @param view    The ADXViewable conforming object
 @return        A new ADXDatasource.
 */
- (instancetype)initWithView:(nullable id<ADXViewable>)view;

/**
 Method to create a new Datasource

 @param view    The ADXViewable conforming object
 @param objects The object to be used by the datasource
 @return        A new ADXDatasource.
 */
- (instancetype)initWithView:(nullable id<ADXViewable>)view objects:(NSArray *)objects;

/**
 Method that should return the classes of the cell you wish to use.

 Used like so:
 @code
 - (NSArray<id> *)cellClasses {
     return [Cell self];
 }
 @endcode

 @return An array of cell classes.
 */
- (NSArray<id> *)cellClasses;

/**
 If you are using multiple sections in your class, please sub class this.

 @param indexPath   The index path for the cell.
 @return            The cell class for the index path.
 */
- (nullable id)cellClassForIndexPath:(NSIndexPath *)indexPath ADX_SWIFT_NAME(cellClass(for:));

/**
 Method to return the number of sections in the View, defaults to 1.

 @return The number of sections.
 */
- (NSInteger)numberOfSections;

/**
 Method to return the number of items in the section, defaults to the objects.count

 @param section     The current section.
 @return            The number of items in the section.
 */
- (NSInteger)numberOfItemsInSection:(NSInteger)section ADX_SWIFT_NAME(numberOfItems(in:));

/**
 Method to return the item at the current index path, defaults at objects[indexPath.item].

 @param indexPath   The index path for the Item.
 @return            The item.
 */
- (nullable id)itemAtIndexPath:(NSIndexPath *)indexPath ADX_SWIFT_NAME(item(at:));

@end

NS_ASSUME_NONNULL_END
