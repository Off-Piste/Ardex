//
//  ADXDatasourceBase.h
//  Ardex
//
//  Created by Harry Wright on 16.10.17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ADXSectionType) {
    ADXSectionTypeInvalid = 0,
    ADXSectionTypeSingularSection,
    ADXSectionTypeMultipleSections,
};

@interface ADXDatasourceBase: NSObject

@property (strong, nonnull) id objects;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfItemsInSection:(NSInteger)section;

- (NSArray *)objectsForSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
