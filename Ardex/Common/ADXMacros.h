//
//  ADXMacros.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#ifndef ADXMacros_h
#define ADXMacros_h

#ifndef ADX_SUBCLASSING_RESTRICTED
#if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#define ADX_SUBCLASSING_RESTRICTED __attribute__((objc_subclassing_restricted))
#else
#define ADX_SUBCLASSING_RESTRICTED
#endif // #if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#endif // #ifndef ADX_SUBCLASSING_RESTRICTED

#define ADX_CLASS(classname, superclass) \
NS_SWIFT_NAME(classname) \
@interface ADX##classname : superclass \

#ifdef __IPHONE_9_3
    #define ADX_SWIFT_NAME(X) NS_SWIFT_NAME(X)
#else
    #define ADX_SWIFT_NAME(X)
#endif // #ifdef __IPHONE_9_3

#endif /* ADXMacros_h */
