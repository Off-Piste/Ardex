//
//  ADXCellable.h
//  Ardex
//
//  Created by Harry Wright on 11.10.17.
//

#ifndef ADXCellable_h
#define ADXCellable_h

@import Foundation;

#import "ADXMacros.h"

/**
 ADXCellable is the protocol that all Cells conform to (Table & Collection)
 so if we have to add or remove methods we can easily do so from here.
 */
ADX_SWIFT_NAME(Cellable)
@protocol ADXCellable <NSObject>

/**
 <#Description#>
 */
@property (strong, nonnull) id datasourceItem;

/**
 <#Description#>

 @return <#return value description#>
 */
+ (NSString *_Nonnull)reuseID;

/**
 <#Description#>
 */
- (void)configureCell;

/**
 <#Description#>
 */
- (void)setupViews;

@end

#endif /* ADXCellable_h */
