//
//  PAUser.h
//  prayApp
//
//  Created by Jeff Wang on 12/11/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAUser : NSObject

@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* userID;
@property (nonatomic, strong) NSMutableArray* groupList;
@property (nonatomic, strong) NSMutableArray* prayerList;

- (id)initWithDict:(NSDictionary*)dict;
@end
