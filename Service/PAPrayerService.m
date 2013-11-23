//
//  PAPrayerService.m
//  prayApp
//
//  Created by Jeff Wang on 8/22/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayerService.h"
#import "PAPrayer.h"
#import "PAComment.h"
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
    prayItme.prayerID = @"11111";
    
    success(self, @[prayItme]);

}

- (void)getChatListing:(NSString*) prayerID
                offset:(int) offset
                limits:(int) limit
               success:(serviceSuccessBlock)success
               failure:(serviceFailureBlock)failure{
    if ([prayerID isEqualToString:@"11111"]) {
        NSMutableArray* commentList = [[NSMutableArray alloc] init];
        NSDictionary* dataDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"9912", @"userID", @"Hope she gets better soon. I think I'm coming down with a cold myself. Just prayed:)", @"comment",@"Susan Chan", @"userNameString", nil];
        PAComment *commentOne = [[PAComment alloc] initWithDictionary:dataDict];
        
        [commentList addObject:commentOne];
        
        NSDictionary* dataDictThree = [[NSDictionary alloc] initWithObjectsAndKeys:@"9912", @"userID", @"Susan Chan", @"userNameString", nil];
        PAComment *commentThree = [[PAComment alloc] initWithDictionary:dataDictThree];
        
        [commentList addObject:commentThree];
        
        NSDictionary* dataDictTWo = [[NSDictionary alloc] initWithObjectsAndKeys:@"9913", @"userID", @"I have plenty of Nyquil at home if you need some. Lmk", @"comment",@"James Smith", @"userNameString", nil];
        PAComment *commentTwo = [[PAComment alloc] initWithDictionary:dataDictTWo];
        
        [commentList addObject:commentTwo];
        
        success(self, commentList);
    }
    else{
        failure(self, [NSError errorWithDomain:@"not found" code:404 userInfo:nil]);
    }
}
- (void)test:(void (^)(void))action{
    ;
}

- (void)anotherTest{
    NSLog(@"OK");
}
@end
