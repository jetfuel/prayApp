//
//  PAPrayerDetailViewController.h
//  prayApp
//
//  Created by Jeff Wang on 8/16/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPrayer.h"
@interface PAPrayerDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    UITableView* contentTableView;
    
    UIView* prayerDetailView;
}

//IBOutlet
@property (nonatomic, strong) IBOutlet UITableView* contentTableView;

@property (nonatomic, strong) IBOutlet UILabel* prayerTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel* prayerGroupLabel;
@property (nonatomic, strong) IBOutlet UILabel* prayerDetailLabel;
@property (nonatomic, strong) IBOutlet UILabel* lastUpdatedLabel;
@property (nonatomic, strong) UIImageView* descriptionImageView;
@property (nonatomic, strong) PAPrayer* prayerItem;


- (void) updateWithPrayerItem:(PAPrayer*)prayer;
@end
