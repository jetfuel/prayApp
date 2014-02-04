//
//  PAHomeViewController.h
//  prayApp
//
//  Created by Jeff Wang on 8/13/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAHomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray* prayerItemList;
    NSMutableArray* prayerGroupList;
}

@property (nonatomic, strong) IBOutlet UITableView* prayListTableView;
- (IBAction) addPrayer:(UIBarButtonItem*)addButton;
- (IBAction) openMenu:(id)sender;

@end
