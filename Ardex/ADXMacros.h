//
//  ADXMacros.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#ifndef ADXMacros_h
#define ADXMacros_h

#define ADX_CLASS(classname, superclass) \
NS_SWIFT_NAME(classname) \
@interface ADX##classname : superclass \

#define ADX_PROTOCOL(name) \
NS_SWIFT_NAME(name) \
@protocol ADX##name <NSObject>

#define ADX_DEBUG

#ifdef ADX_DEBUG
#define ADXLog(s, ...) NSString *__msg = [NSString stringWithFormat:s, ##__VA_ARGS__]; NSLog(@"%@", [NSString stringWithFormat:@"[%s:%d] %@", __PRETTY_FUNCTION__, __LINE__, __msg])
#else
#define ADXLog(s, ...)
#endif

#endif /* ADXMacros_h */
