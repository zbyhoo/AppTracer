//
//  ATLoggerConfiguration.m
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/19/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import "ATLoggerConfiguration.h"
#import "ATLoggerFactory.h"
#import "ATLogger.h"

const NSString* const CONFIG_AT_LOGGER_OUTPUT = @"ATLoggerOutput";
const NSString* const CONFIG_AT_LOGGER_MODE = @"ATLoggerMode";

@implementation ATLoggerConfiguration

@synthesize loggerOutput, loggerMode;

- (id) init
{
    self = [super init];
    if (self)
    {
        _defaultLoggerOutput = AT_LOGGER_CONSOLE;
        _defaultLoggerMode = AT_MODE_ALL;
    }
    return self;
}

- (BOOL) readConfiguratonFromInfoPlist
{
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    if (!infoDictionary)
        return NO;
    
    NSString* loggerOutputDefinition = [infoDictionary objectForKey:CONFIG_AT_LOGGER_OUTPUT];
    NSString* loggerModeDefinition = [infoDictionary objectForKey:CONFIG_AT_LOGGER_MODE];
    
    self.loggerOutput = _defaultLoggerOutput;
    self.loggerMode = _defaultLoggerMode;

    return YES;
}

@end
