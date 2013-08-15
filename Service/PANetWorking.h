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

+(id)shareInstance;
@end
