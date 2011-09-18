//
//  ATAppleSystemLogger.m
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import "ATAppleSystemLogger.h"

@implementation ATAppleSystemLogger

- (id) initWithConsoleOutput:(BOOL)console
                  fileOutput:(NSString*)filePath
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

- (void) logMessage:(NSString*)message withLevel:(AtLogLevel)level
{
    NSLog(@"logging in ASL"); //TODO implement
}

@end
