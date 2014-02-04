//
//  PAPrayer.m
//  prayApp
//
//  Created by Jeff Wang on 8/5/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayer.h"
#import "PAComment.h"

@implementation PAPrayer
@synthesize prayerContext, prayerID, prayerTitle, userID, createdDate, statusUpdate, statusUpdateID, groupID, groupName, userNameString, commentList;


- (id)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    
    if (self){
        if (dict != nil){
            NSLog(@"The dict is %@", dict);
            if ([dict objectForKey:@"context"])
                self.prayerContext = [dict objectForKey:@"context"];
            
            if ([dict objectForKey:@"prayerID"])
                self.prayerID = [dict objectForKey:@"prayerID"];
            
            if ([dict objectForKey:@"prayer"])
                self.prayerTitle = [dict objectForKey:@"prayer"];
            
            if ([dict objectForKey:@"createdDate"])
                self.createdDate = [dict objectForKey:@"createdDate"];
            
            if ([dict objectForKey:@"group"])
                self.groupName = [dict objectForKey:@"group"];
            
            if ([dict objectForKey:@"owner"])
                self.userNameString = [dict objectForKey:@"owner"];
            
            if ([dict objectForKey:@"comments"]){
                commentList = [[NSMutableArray alloc] init];
//                NSArray* commentsDict = [dict objectForKey:@"comments"];
//                
//                for (int i = 0; i < [commentsDict count]; i++) {
//                    PAComment * comment = [[PAComment alloc] initWithDictionary:[commentsDict objectAtIndex:i]];
//                    [commentList addObject:comment];
//                }
            }
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
