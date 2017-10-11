//
//  ADXLog.h
//  Ardex
//
//  Created by Harry Wright on 11.10.17.
//

#ifndef ADXLog_h
#define ADXLog_h

#define ADX_LOG_MSG(s, ...) [NSString stringWithFormat:s, ##__VA_ARGS__]
#define ADX_LOG_FMT         @"[%s:%d] %@", __PRETTY_FUNCTION__, __LINE__

#define ADX_DEBUG

#ifdef ADX_DEBUG
#define ADXLog(s, ...) do { NSLog(@"%@", [NSString stringWithFormat:ADX_LOG_FMT, ADX_LOG_MSG(s, ##__VA_ARGS__)]); } while(0)
#else
#define ADXLog(s, ...)
#endif

#endif /* ADXLog_h */
