//
//  PAAddPrayerViewController.h
//  prayApp
//
//  Created by Jeff Wang on 12/16/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAGroupSelectionViewController.h"

@interface PAAddPrayerViewController : UIViewController<PAGroupSelectionViewDelegate>
-(IBAction)cancelButtonClicked:(id)sender;
-(IBAction)groupButtonClicked:(id)sender;

@property (nonatomic, strong) IBOutlet UIButton* groupButton;
@property (nonatomic, strong) NSMutableArray* prayerGroupList;
@end
