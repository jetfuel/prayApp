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
            if ([dict objectForKey:@"message"]){
                self.comment = [dict objectForKey:@"message"];
                self.isPrayedAction = NO;
            }
            else
                isPrayedAction = YES;
            
            if ([dict objectForKey:@"commentID"]){
                self.commentID = [dict objectForKey:@"commentID"];
            }
            
            if ([dict objectForKey:@"owner"]){
                self.userID = [dict objectForKey:@"owner"];
            }
            
            if ([dict objectForKey:@"userNameString"]){
                self.userNameString = [dict objectForKey:@"userNameString"];
            }
            else{
                self.userNameString = self.userID;
            }
            
            if ([dict objectForKey:@"timestamp"]){
                self.createdDate = [dict objectForKey:@"timestamp"];
            }
        }
    }
    
    return self;
}


- (NSString*)description{
    NSString* string = [NSString stringWithFormat:@"Name:%@, comment:%@", self.userID, self.comment];
    return string;
}
@end
