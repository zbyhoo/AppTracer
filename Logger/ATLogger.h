//
//  ATLogger.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATLoggerMessanger.h"

//! Mode of the logger. Values that specifies which messages should be logged.
enum AtLoggerMode
{
    AT_MODE_UPTO_ERROR = AT_LOG_LEVEL_ERROR,
    AT_MODE_UPTO_WARNING = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING,
    AT_MODE_UPTO_INFO = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING | AT_LOG_LEVEL_INFO,
    AT_MODE_UPTO_DEBUG = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING | AT_LOG_LEVEL_INFO | AT_LOG_LEVEL_DEBUG,
    AT_MODE_ALL = AT_LOG_LEVEL_ERROR | AT_LOG_LEVEL_WARNING | AT_LOG_LEVEL_INFO | AT_LOG_LEVEL_DEBUG
};

#if defined DEBUG

//! Uses shared logger to log message
//! \param level Message priority
//! \param message Message text to log
//! \param ... Variable arguments for formatting message
#define AT_LOG(level, message, ...) \
    [[ATLogger sharedLogger] logMessageWithLevel:level \
                                            file:__FILE__ \
                                            line:__LINE__ \
                                        format:message, ##__VA_ARGS__]

//! Logging error message
//! \param message Message text to log
//! \param ... Variable arguments for formatting message
#define AT_LOG_ERROR(message, ...)      AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)

//! Logging warning message
//! \param message Message text to log
//! \param ... Variable arguments for formatting message
#define AT_LOG_WARNING(message, ...)    AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)

//! Logging information message
//! \param message Message text to log
//! \param ... Variable arguments for formatting message
#define AT_LOG_INFO(message, ...)       AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)

//! Logging debug message
//! \param message Message text to log
//! \param ... Variable arguments for formatting message
#define AT_LOG_DEBUG(message, ...)      AT_LOG(AT_LOG_LEVEL_INFO, message, ##__VA_ARGS__)

#else

//! Disabling message logging in non-debug builds
#define AT_LOG(level, message, ...) ;

#endif

//! Manages logger and is the center for messages logging
@interface ATLogger : NSObject
{
@private
    id<ATLoggerMessanger> _logger;  //!< Logger instance that is used to log messages
    NSInteger _loggerMode;          //!< Mode of the logger. Types of messages priorities to log 
}

//! Creates (if not yet created) and returns shared ATLogger instance (singleton)
//! \return Singletion ATlogger instance
+ (ATLogger*) sharedLogger;

//! Releases shared instance of ATLogger
+ (void) deallocSharedLogger;

//! Creates logger instance that will be used to log messages
//! \param output Type of output destinations. Can be one or mutliple value of ATLoggerOutput
//! \param mode Specifies priorities of messages to log. Can be one or multiple values of AtLogLevel or AtLoggerMode
- (void) createLoggerWithOutput:(int)output mode:(NSInteger)mode;

//! Creates logger instance with default parameters. It is used when user do not creates logger by own.
- (void) createDefaultLogger;

//! Logs message
//! \param level Message priority
//! \param file File from which the log was called
//! \param line Line of code from which the log was called
//! \param format Message to log
//! \param ... Variable arguments for formatting message 
- (void) logMessageWithLevel:(AtLogLevel)level 
                        file:(const char*)file 
                        line:(int)line 
                      format:(NSString*)format, ...;

//! Checks is th message with given level should be logged
//! \param level Message priority
//! \return YES if message should be logged, NO otherwise.
- (BOOL) shouldLogMessageWithLevel:(AtLogLevel)level;

//! Formats message that will be logged
//! \param message Test message to log
//! \param file File from which the log was called
//! \param line Line of code from which the log was called
//! \return Formatted message (autoreleased)
- (NSString*) formatMessage:(NSString*)message 
                       file:(const char*)file 
                       line:(int)line;

@end
