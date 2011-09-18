//
//  ATLoggerMessanger.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Log messages priorities
typedef enum
{
    AT_LOG_LEVEL_DEBUG    = 1 << 0,
    AT_LOG_LEVEL_INFO     = 1 << 1,
    AT_LOG_LEVEL_WARNING  = 1 << 2,
    AT_LOG_LEVEL_ERROR    = 1 << 3
} AtLogLevel;

//! Functionality definition for all loggers
@protocol ATLoggerMessanger <NSObject>

@required

//! Log message
//! \param message Message to log
//! \param level Message priority
- (void) logMessage:(NSString*)message withLevel:(AtLogLevel)level;

@end
