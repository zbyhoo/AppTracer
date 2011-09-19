//
//  ATLoggerConfiguration.h
//  AppTracer
//
//  Created by Zbigniew Kominek on 9/19/11.
//  Copyright 2011 Zbigniew Kominek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATLoggerConfiguration : NSObject
{
@private
    NSInteger _defaultLoggerOutput;
    NSInteger _defaultLoggerMode;
}

@property (nonatomic, assign) NSInteger loggerOutput;
@property (nonatomic, assign) NSInteger loggerMode;

- (BOOL) readConfiguratonFromInfoPlist;

@end
