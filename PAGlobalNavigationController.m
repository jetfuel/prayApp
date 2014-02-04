//
//  PAGlobalNavigationController.m
//  prayApp
//
//  Created by Jeff Wang on 2/3/14.
//  Copyright (c) 2014 Jeff Wang. All rights reserved.
//

#import "PAGlobalNavigationController.h"
#import <FacebookSDK/FacebookSDK.h>

#define kMenuWidth 260
@interface PAGlobalNavigationController ()

@end

@implementation PAGlobalNavigationController
@synthesize menuView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    isMenuRevealed = NO;
    prayerGroupList = @[@"Canaan Church", @"Family", @"ACF"];
    
    if (menuView == nil){
        menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMenuWidth, self.view.bounds.size.height)];
        [self.view insertSubview:menuView atIndex:0];
    }
    
    menuTableView = [[UITableView alloc] initWithFrame:menuView.frame style:UITableViewStylePlain];
    menuTableView.delegate = self;
    menuTableView.dataSource = self;
    menuTableView.backgroundColor = [UIColor darkGrayColor];
    [menuTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [menuView addSubview:menuTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleMenu{
    if (isMenuRevealed == NO){
        [self slideRightToRevealMenu];
    }
    else{
        [self slideLeftToHideMenu];
    }
}
- (void)slideRightToRevealMenu{
    if (isMenuRevealed == NO){
        isMenuRevealed = YES;
        [UIView animateWithDuration:0.35 animations:^{
            for (UIView* view in self.view.subviews){
                if (view != menuView){
                    CGRect frame = view.frame;
                    frame.origin.x += kMenuWidth;
                    view.frame = frame;
                }
            }
        }];
    }
}

- (void)slideLeftToHideMenu{
    if (isMenuRevealed == YES){
        isMenuRevealed = NO;
        [UIView animateWithDuration:0.35 animations:^{
            for (UIView* view in self.view.subviews){
                if (view != menuView){
                    CGRect frame = view.frame;
                    frame.origin.x -= kMenuWidth;
                    view.frame = frame;
                }
            }
        }];
    }
}

#pragma TableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [prayerGroupList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMenuWidth, 100)];
//    FBProfilePictureView* profileView = [[FBProfilePictureView alloc] initWithProfileID:(NSString *) pictureCropping];
    return footerView;
}
//
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMenuWidth, 100)];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5 + 20, kMenuWidth, 20)];
    label.text = @"My PrayerList";
    [headerView addSubview:label];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [prayerGroupList objectAtIndex:indexPath.row];
    return cell;
}
@end
