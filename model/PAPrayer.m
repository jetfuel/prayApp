//
//  PAPrayer.m
//  prayApp
//
//  Created by Jeff Wang on 8/5/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayer.h"

@implementation PAPrayer
@synthesize prayerContext, prayerID, prayerTitle, userID, createdDate, statusUpdate, statusUpdateID, groupID, groupName, userNameString;


- (id)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    
    if (self){
        if (dict != nil){
            
            @try {
                [self setValuesForKeysWithDictionary:dict];
            }
            @catch (NSException *exception) {
                NSLog(@"exception is %@",exception);
            }
            
//            if ([dict objectForKey:@"prayerContext"])
//                self.prayerContext = [dict objectForKey:@"prayerContext"];
//            
//            if ([dict objectForKey:@"prayerID"])
//                self.prayerID = [dict objectForKey:@"prayerID"];
//            
//            if ([dict objectForKey:@"prayerTitle"])
//                self.prayerTitle = [dict objectForKey:@"prayerTitle"];
//            
//            if ([dict objectForKey:@"createdDate"])
//                self.createdDate = [dict objectForKey:@"createdDate"];
        }
    }
    
    return self;
}

- (id) initWithCoder:(NSCoder *)decoder
{
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	
}

- (NSString*)description{
    NSString* string = [NSString stringWithFormat:@"id:%@, title:%@, group:%@, detail:%@", self.prayerID, self.prayerTitle, self.groupName, self.prayerContext];
    return string;
}
@end
