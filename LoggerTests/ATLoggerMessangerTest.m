//
//  ATLoggerMessangerTest.m
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/18/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import "ATLoggerMessanger.h"
#import "ATAppleSystemLogger.h"

@interface ATLoggerMessangerTest : SenTestCase
@end

@implementation ATLoggerMessangerTest

- (void)test_respondsToLogMessageSelector
{    
    // given
    id<ATLoggerMessanger> logger = [[ATAppleSystemLogger alloc] init];
    
    // when
    BOOL result = [logger respondsToSelector:NSSelectorFromString(@"logMessage:withLevel:")];
    
    // then
    STAssertTrue(result, nil);
}

@end
