//
//  PAUser.m
//  prayApp
//
//  Created by Jeff Wang on 12/11/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAUser.h"

@implementation PAUser
@synthesize userID, userName, groupList, prayerList;

- (id)initWithDict:(NSDictionary*)dict{
    self = [self init];
    
    if (self && dict != nil){
        userName = [dict objectForKey:@"name"];
        groupList = [dict objectForKey:@"groups"];
        prayerList = [dict objectForKey:@"prayers"];
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
    NSString* string = [NSString stringWithFormat:@"Name:%@, groups:%@, prayers:%@", self.userName, self.groupList, self.prayerList];
    return string;
}
@end
