//
//  ATAppleSystemLogger.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATLoggerMessanger.h"

//! Logger based on Apple System Logger (ASL)
@interface ATAppleSystemLogger : NSObject <ATLoggerMessanger>

//! Initializes logger instance
//! \param console Flag that specifies if the logger should write message to console
//! \param filePath Name of the file to store log messages (if nil, no file is created)
//! \return Initialized ASL logger instance
- (id) initWithConsoleOutput:(BOOL)console
                  fileOutput:(NSString*)filePath;

@end
