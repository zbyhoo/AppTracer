//
//  ATAppleSystemLogger.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATLoggerMessanger.h"

@interface ATAppleSystemLogger : NSObject <ATLoggerMessanger>

- (id) initWithConsoleOutput:(BOOL)console
                  fileOutput:(NSString*)filePath;

@end
