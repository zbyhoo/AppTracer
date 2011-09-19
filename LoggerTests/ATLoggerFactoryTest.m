//
//  ATLoggerFactoryTest.m
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/19/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import "ATLoggerFactory.h"

@interface ATLoggerFactoryTest : SenTestCase
@end

@implementation ATLoggerFactoryTest

- (void) test_newLogger_console
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerOutput = AT_LOGGER_CONSOLE;
    
    // when
    id logger = [factory newLogger:loggerOutput];
    
    // then
    STAssertNotNil(logger, nil);
}

- (void) test_newLogger_file
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerOutput = AT_LOGGER_FILE;
    
    // when
    id logger = [factory newLogger:loggerOutput];
    
    // then
    STAssertNotNil(logger, nil);
}

- (void) test_newLogger_consoleAndFile
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerOutput = AT_LOGGER_FILE | AT_LOGGER_CONSOLE;
    
    // when
    id logger = [factory newLogger:loggerOutput];
    
    // then
    STAssertNotNil(logger, nil);
}

- (void) test_newLogger_noOutputType
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerOutput = 0;
    
    // when, then
    STAssertThrows([factory newLogger:loggerOutput], nil);
}

- (void) test_newLogger_unknownOutputType
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerOutput = 8;
    
    // when, then
    STAssertThrows([factory newLogger:loggerOutput], nil);
}

- (void) test_logFilePath
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter release];
    
    NSString* expectedPath = [NSString stringWithFormat:@"AppTracer_%@.log", formattedDateString];
    
    // when
    NSString* logFilePath = [factory logFilePath];
    
    // then
    STAssertEqualObjects(logFilePath, expectedPath, nil);
}

@end
