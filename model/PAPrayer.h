//
//  PAPrayer.h
//  prayApp
//
//  Created by Jeff Wang on 8/5/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAPrayer : NSObject<NSCoding>{
    
}
- (id)initWithDictionary:(NSDictionary*)dict;
@property (nonatomic, strong) NSString* prayerTitle;
@property (nonatomic, strong) NSString* prayerContext;
@property (nonatomic, strong) NSString* prayerID;
@property (nonatomic, strong) NSString* userID;
@property (nonatomic, strong) NSString* userNameString;
@property (nonatomic, strong) NSMutableArray* commentList;
@property (nonatomic, strong) NSDate* createdDate;

@property (nonatomic, strong) NSString* statusUpdate;
@property (nonatomic, strong) NSString* statusUpdateID;

@property (nonatomic, strong) NSString* groupName;
@property (nonatomic, strong) NSString* groupID;

@end
