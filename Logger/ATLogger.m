//
//  ATLogger.m
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import "ATLogger.h"
#import "ATLoggerFactory.h"
#import "ATLoggerConfiguration.h"

@implementation ATLogger

static ATLogger* sharedLogger = nil;

+ (ATLogger*) sharedLogger
{
    if (!sharedLogger)
    {
        @synchronized(self)
        {
            if (!sharedLogger)
                sharedLogger = [[ATLogger alloc] init];
        }
    }
    return sharedLogger;
}

+ (void) deallocSharedLogger
{
    if (sharedLogger)
    {
        @synchronized(self)
        {
            if (sharedLogger)
            {
                [sharedLogger release];
                sharedLogger = nil;
            }
        }
    }
}

- (void) dealloc
{
    [_logger release];
    _logger = nil;
    
    [super dealloc];
}

- (void) createLoggerWithOutput:(int)output mode:(NSInteger)mode
{
    NSAssert1(_logger == nil, @"ATLogger already created: %@", [_logger class]);
    if (_logger)
        [_logger release];
        
    ATLoggerFactory* loggerFactory = [[ATLoggerFactory alloc] init];
    _logger = [loggerFactory newLogger:output];
    [loggerFactory release];
    
    _loggerMode = mode;
}

- (void) createDefaultLogger
{
    ATLoggerConfiguration* configuration = [[ATLoggerConfiguration alloc] init];
    [self createLoggerWithOutput:configuration.loggerOutput mode:configuration.loggerMode];
    [configuration release];
}

- (void) logMessageWithLevel:(AtLogLevel)level 
                        file:(const char*)file 
                        line:(int)line 
                      format:(NSString*)format, ...
{
    if (!_logger)
        [self createDefaultLogger];
        
    if ([self shouldLogMessageWithLevel:level] == NO)
        return;
    
    va_list argument_list;
	va_start(argument_list, format);
	NSString *messageWithArguments = [[NSString alloc] initWithFormat:format arguments:argument_list];
    va_end(argument_list);
    
    NSString* message = [self formatMessage:messageWithArguments file:file line:line];
    [messageWithArguments release];
    
    [_logger logMessage:message withLevel:level];
}

- (BOOL) shouldLogMessageWithLevel:(AtLogLevel)level
{
#if defined DEBUG 
    return (_loggerMode & level);
#else
    return NO;
#endif
}

- (NSString*) formatMessage:(NSString*)message 
                       file:(const char*)file 
                       line:(int)line
{
    return [NSString stringWithFormat:@"%s:%d: %@", file, line, message];
}
                         
@end
