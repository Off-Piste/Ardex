//
//  ADXAssert.h
//  Ardex
//
//  Created by Harry Wright on 11.10.17.
//

#ifndef ADXAssert_h
#define ADXAssert_h

#ifndef ADXAssert
#define ADXAssert( condition, ... ) NSCAssert( (condition) , ##__VA_ARGS__)
#endif // ADXAssert

#ifndef ADXFailAssert
#define ADXFailAssert( ... ) ADXAssert( (NO) , ##__VA_ARGS__)
#endif // ADXFailAssert

#ifndef ADXParameterAssert
#define ADXParameterAssert( condition ) ADXAssert( (condition) , @"Invalid parameter not satisfying: %@", @#condition)
#endif // ADXParameterAssert

#ifndef ADXAssertMainThread
#define ADXAssertMainThread() ADXAssert( ([NSThread isMainThread] == YES), @"Must be on the main thread")
#endif // ADXAssertMainThread

#endif /* ADXAssert_h */
