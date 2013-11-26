//
//  PAPrayerService.h
//  prayApp
//
//  Created by Jeff Wang on 8/22/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PANetWorking.h"

@interface PAPrayerService : PANetWorking
- (void)getPrayerList:(NSString*) userId
              success:(serviceSuccessBlock) success
              failure:(serviceFailureBlock) failure;

- (void)getChatListing:(NSString*) prayerID
                offset:(int) offset
                limits:(int) limit
               success:(serviceSuccessBlock)success
               failure:(serviceFailureBlock)failure;

- (void)setPrayActionForlisting:(NSString*)prayerID
                         userId:(NSString*)userID
                        success:(serviceSuccessBlock)success
                        failure:(serviceFailureBlock)failure;

- (void)test:(void (^)(void))action;
//             (void (^)(void))animations
//+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);

- (void)anotherTest;
@end
