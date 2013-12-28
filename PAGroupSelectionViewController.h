//
//  PAGroupSelectionViewController.h
//  prayApp
//
//  Created by Jeff Wang on 12/27/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PAGroupSelectionViewDelegate <NSObject>

- (void)groupSelectionDidSelect:(NSString*)prayerGroup;
- (void)groupSelectionDidCancel;
@end
@interface PAGroupSelectionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    UITableView* prayerGroupTableView;
    int selectedGroupIndex;
}
@property (nonatomic, assign) id<PAGroupSelectionViewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray* prayerGroupList;
@end
