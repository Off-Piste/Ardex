//
//  ADXCellable.h
//  Ardex
//
//  Created by Harry Wright on 11.10.17.
//

#ifndef ADXCellable_h
#define ADXCellable_h

#import "ADXMacros.h"

/**
 ADXCellable is the protocol that all Cells conform to (Table & Collection)
 so if we have to add or remove methods we can easily do so from here.
 */
ADX_PROTOCOL(Cellable)

@property (strong, nullable) id datasourceItem;

+ (NSString *_Nonnull)reuseID;

- (void)configureCell;

- (void)setupViews;

@end

#endif /* ADXCellable_h */
