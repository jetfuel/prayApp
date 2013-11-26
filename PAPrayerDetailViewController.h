//
//  PAPrayerDetailViewController.h
//  prayApp
//
//  Created by Jeff Wang on 8/16/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPrayer.h"
#import "PAEncourageView.h"
@interface PAPrayerDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, PAEncourageViewDelegate>{
    UITableView* contentTableView;
    
    UIView* prayerDetailView;
    
    NSMutableArray* commentListing;
    BOOL isLoadingChats;
    UIActivityIndicatorView* loadingChatIndicator;
    PAEncourageView* encourageView;
    BOOL isEncourageViewHidden;
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
