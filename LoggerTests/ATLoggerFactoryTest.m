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
    NSInteger loggerType = AT_LOGGER_CONSOLE;
    
    // when
    id logger = [factory newLogger:loggerType];
    
    // then
    STAssertNotNil(logger, nil);
}

- (void) test_newLogger_file
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerType = AT_LOGGER_FILE;
    
    // when
    id logger = [factory newLogger:loggerType];
    
    // then
    STAssertNotNil(logger, nil);
}

- (void) test_newLogger_consoleAndFile
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerType = AT_LOGGER_FILE | AT_LOGGER_CONSOLE;
    
    // when
    id logger = [factory newLogger:loggerType];
    
    // then
    STAssertNotNil(logger, nil);
}

- (void) test_newLogger_noType
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerType = 0;
    
    // when, then
    STAssertThrows([factory newLogger:loggerType], nil);
}

- (void) test_newLogger_unknownType
{
    // given
    ATLoggerFactory* factory = [[ATLoggerFactory alloc] init];
    NSInteger loggerType = 8;
    
    // when, then
    STAssertThrows([factory newLogger:loggerType], nil);
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
