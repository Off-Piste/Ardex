//
//  ADXMacros.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#ifndef ADXMacros_h
#define ADXMacros_h

#define ADX_CLASS(classname) \
NS_SWIFT_NAME(classname) \
@interface ADX##classname : NSObject \

#define ADX_CLASS_SUPER(classname, superclass) \
NS_SWIFT_NAME(classname) \
@interface ADX##classname : superclass \

#define ADX_PROTOCOL(name) \
NS_SWIFT_NAME(name) \
@protocol ADX##name <NSObject>

#endif /* ADXMacros_h */
