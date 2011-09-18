//
//  ATLogger.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATLoggerMessanger.h"

enum AT_LOGGER_MODE
{
    AT_MODE_UPTO_ERROR = AT_LOG_LEVEL_ERROR,
    AT_MODE_UPTO_WARNING = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING,
    AT_MODE_UPTO_INFO = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING | AT_LOG_LEVEL_INFO,
    AT_MODE_UPTO_DEBUG = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING | AT_LOG_LEVEL_INFO | AT_LOG_LEVEL_DEBUG,
    AT_MODE_ALL = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING | AT_LOG_LEVEL_INFO | AT_LOG_LEVEL_DEBUG
};

#if defined DEBUG

#define AT_LOG(level, message, ...) \
    [[ATLogger defaultLogger] logMessageWithLevel:level \
                                             file:__FILE__ \
                                             line:__LINE__ \
                                           format:message, ##__VA_ARGS__]

#define AT_LOG_ERROR(message, ...)      AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)
#define AT_LOG_WARNING(message, ...)    AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)
#define AT_LOG_INFO(message, ...)       AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)
#define AT_LOG_DEBUG(message, ...)      AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)

#else

#define AT_LOG(level, message, ...) ; /* disabled */

#endif

@interface ATLogger : NSObject
{
@private
    id<ATLoggerMessanger> _logger;
    NSInteger _loggerMode;
}

+ (ATLogger*) defaultLogger;
+ (void) deallocDefaultLogger;

- (void) createLoggerWithOutput:(int)output mode:(NSInteger)mode;
- (void) createDefaultLogger;

- (void) logMessageWithLevel:(AtLogLevel)level 
                        file:(const char*)file 
                        line:(int)line 
                      format:(NSString*)format, ...;

- (BOOL) shouldLogMessageWithLevel:(AtLogLevel)level;

- (NSString*) formatMessage:(NSString*)message 
                       file:(const char*)file 
                       line:(int)line;

@end
