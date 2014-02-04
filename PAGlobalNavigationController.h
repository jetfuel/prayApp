//
//  PAGlobalNavigationController.h
//  prayApp
//
//  Created by Jeff Wang on 2/3/14.
//  Copyright (c) 2014 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAGlobalNavigationController : UINavigationController<UITableViewDataSource, UITableViewDelegate>{
    BOOL isMenuRevealed;
    UITableView* menuTableView;
    NSArray* prayerGroupList;
}

@property (nonatomic, strong) UIView* menuView;
- (void)toggleMenu;
- (void)slideRightToRevealMenu;
- (void)slideLeftToHideMenu;
@end
