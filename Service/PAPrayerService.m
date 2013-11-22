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
    prayItme.prayerTitle = @"Claudia's fever is really bad and this is it";
    prayItme.prayerContext = @"Caludia had a nasty cold that's making it difficult for her to go to sleep. Please pray for healing and that it won't affect her work and life too much.";
    prayItme.groupName = @"canaan church";
    prayItme.userNameString = @"John Brown";
    
    success(self, @[prayItme]);

}

- (void)test:(void (^)(void))action{
    ;
}

- (void)anotherTest{
    NSLog(@"OK");
}
@end
