//
//  PAPrayListTableViewCell.h
//  prayApp
//
//  Created by Jeff Wang on 8/14/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPrayer.h"
@interface PAPrayListTableViewCell : UITableViewCell{
    UIView* checkConfirmView;
}

- (void)updateWithPrayer:(PAPrayer*) prayerItem;
@end
