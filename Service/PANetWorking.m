//
//  PANetWorking.m
//  prayApp
//
//  Created by Jeff Wang on 8/13/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PANetWorking.h"

@implementation PANetWorking

+(id)shareInstance{
    static PANetWorking * _shareInstance= nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[PANetWorking alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.prayerapp.com"]];
    });

    return _shareInstance;
}
@end
