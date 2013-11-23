//
//  PAComment.m
//  prayApp
//
//  Created by Jeff Wang on 8/5/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAComment.h"

@implementation PAComment
@synthesize comment, commentID, userID, createdDate, userNameString, isPrayedAction;

- (id)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    if (self){
        if (dict != nil){
            if ([dict objectForKey:@"comment"]){
                self.comment = [dict objectForKey:@"comment"];
                self.isPrayedAction = NO;
            }
            else
                isPrayedAction = YES;
            
            if ([dict objectForKey:@"commentID"]){
                self.commentID = [dict objectForKey:@"commentID"];
            }
            
            if ([dict objectForKey:@"userID"]){
                self.userID = [dict objectForKey:@"userID"];
            }
            
            if ([dict objectForKey:@"userNameString"]){
                self.userNameString = [dict objectForKey:@"userNameString"];
            }
            
            if ([dict objectForKey:@"createdDate"]){
                self.createdDate = [dict objectForKey:@"createdDate"];
            }
        }
    }
    
    return self;
}
@end
