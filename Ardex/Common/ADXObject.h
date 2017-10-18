//
//  ADXSectionObject.h
//  Ardex
//
//  Created by Harry Wright on 12.10.17.
//

#ifndef ADXSectionObject_h
#define ADXSectionObject_h

#import "ADXMacros.h"

ADX_SWIFT_NAME(Object)
@protocol ADXObject <NSObject>

@property (strong, readonly, nonnull) id<NSObject> index;

@optional
- (BOOL)isEqualToSectionObject:(nullable id<ADXObject>)object;

@end

#endif /* ADXSectionObject_h */
