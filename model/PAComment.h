//
//  PAComment.h
//  prayApp
//
//  Created by Jeff Wang on 8/5/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAComment : NSObject{
    
}

@property (nonatomic, strong) NSString* comment;
@property (nonatomic, strong) NSString* commentID;
@property (nonatomic, strong) NSString* userID;
@property (nonatomic, strong) NSString* userNameString;
@property (nonatomic, strong) NSDate* createdDate;
@property (nonatomic) BOOL isPrayedAction;
- (id)initWithDictionary:(NSDictionary*)dict;
@end
