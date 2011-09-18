//
//  ATLoggerFactory.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATLoggerMessanger.h"

//! Logger output destinations
enum AtLoggerOutput
{
    AT_LOGGER_CONSOLE   = 1 << 0,
    AT_LOGGER_FILE      = 1 << 1
};

//! Creates concrete logger
@interface ATLoggerFactory : NSObject
{
@private
    NSString* _logFilePath; //!< Path and name of the log file
}

//! Creates logger instance based on given type
//! \param type Logger type. Can be single or multiple value of AtLoggerOutput
//! \return Allocated and initialized logger instance (not autoreleased)
- (id<ATLoggerMessanger>) newLogger:(NSInteger)type;

//! Returns path and name of the log file
//! \return String containing path and name of the log file
- (NSString*) logFilePath;

@end
