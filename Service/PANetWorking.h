//
//  PANetWorking.h
//  prayApp
//
//  Created by Jeff Wang on 8/13/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface PANetWorking : AFHTTPClient
typedef void (^serviceSuccessBlock)(PANetWorking *service, id responseObject);
typedef void (^serviceSuccessBlockWithOperation)(AFHTTPRequestOperation* operation, PANetWorking *service, id responseObject);
typedef void (^serviceFailureBlock)(PANetWorking *service, NSError* error);
typedef void (^serviceFailureWithDetailsBlock)(PANetWorking *service, id responseObject, NSError* error);

+(id)shareInstance;
@end
