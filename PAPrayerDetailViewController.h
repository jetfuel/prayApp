//
//  PAPrayerDetailViewController.h
//  prayApp
//
//  Created by Jeff Wang on 8/16/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPrayer.h"
@interface PAPrayerDetailViewController : UIViewController

//IBOutlet
@property (nonatomic, strong) IBOutlet UILabel* prayerTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel* prayerGroupLabel;
@property (nonatomic, strong) IBOutlet UILabel* prayerDetailLabel;
@property (nonatomic, strong) IBOutlet UILabel* lastUpdatedLabel;

@property (nonatomic, strong) PAPrayer* prayerItem;
@end
