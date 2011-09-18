//
//  ATLoggerFactory.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATLoggerMessanger.h"

enum AtLoggerOutput
{
    AT_LOGGER_CONSOLE   = 1 << 0,
    AT_LOGGER_FILE      = 1 << 1
};

@interface ATLoggerFactory : NSObject
{
@private
    NSString* _logFilePath;
}

- (id<ATLoggerMessanger>) newLogger:(NSInteger)type;
- (NSString*) logFilePath;

@end
