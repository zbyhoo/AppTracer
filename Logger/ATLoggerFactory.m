//
//  ATLoggerFactory.m
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import "ATLoggerFactory.h"
#import "ATAppleSystemLogger.h"

@implementation ATLoggerFactory

- (void) dealloc
{
    [_logFilePath release];
    _logFilePath = nil;
    
    [super dealloc];
}

- (id<ATLoggerMessanger>) newLogger:(NSInteger)type
{
    BOOL consoleOutput = type & AT_LOGGER_CONSOLE;
    BOOL fileOutput = type & AT_LOGGER_FILE;
    
    NSString* fileOutputPath = fileOutput ? [self logFilePath] : nil;
    
    return [[ATAppleSystemLogger alloc] initWithConsoleOutput:consoleOutput fileOutput:fileOutputPath];
}

- (NSString*) logFilePath
{
    if (!_logFilePath)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];
        [dateFormatter release];
        
        NSString *processName = [[NSProcessInfo processInfo] processName];
        
        _logFilePath = [[NSString stringWithFormat:@"%@_%@.log", processName, formattedDateString] retain];
    }
    return _logFilePath;
}

@end
