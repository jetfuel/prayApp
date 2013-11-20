//
//  PAPrayerService.m
//  prayApp
//
//  Created by Jeff Wang on 8/22/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayerService.h"
#import "PAPrayer.h"
@implementation PAPrayerService

+(id)shareInstance{
    static PAPrayerService * _shareInstance= nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[PAPrayerService alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.prayerapp.com"]];
    });
    
    return _shareInstance;
}

- (void)getPrayerList:(NSString*) userId
              success:(serviceSuccessBlock) success
              failure:(serviceFailureBlock) failure{
    
    PAPrayer* prayItme = [[PAPrayer alloc] init];
    prayItme.prayerTitle = @"Pray for health";
    prayItme.prayerContext = @"Pter Lin in Family";
    prayItme.groupName = @"canaan church";
    
    success(self, @[prayItme]);

}

- (void)test:(void (^)(void))action{
    ;
}

- (void)anotherTest{
    NSLog(@"OK");
}
@end
