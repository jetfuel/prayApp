//
//  PAAddPrayerViewController.m
//  prayApp
//
//  Created by Jeff Wang on 12/16/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAAddPrayerViewController.h"

@interface PAAddPrayerViewController (){
    UIButton* selectGroupButton;
    PAGroupSelectionViewController* groupSelectionViewController;
}

@end

@implementation PAAddPrayerViewController
@synthesize prayerGroupList, groupButton;

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
    self.view.backgroundColor = [UIColor whiteColor];
    groupSelectionViewController = [[PAGroupSelectionViewController alloc] init];
    groupSelectionViewController.prayerGroupList = prayerGroupList;
    groupSelectionViewController.delegate = self;
    // Update the prayer group button text.
    if (prayerGroupList != nil && [prayerGroupList count] > 0){
        [groupButton setTitle:[prayerGroupList objectAtIndex:0] forState:UIControlStateNormal];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelButtonClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)groupButtonClicked:(id)sender{
    UINavigationController* navigationVC = [[UINavigationController alloc] initWithRootViewController:groupSelectionViewController];
    [self presentViewController:navigationVC animated:YES completion:^{
        ;
    }];
}

- (void)createPrayer:(UIBarButtonItem*)button{
}

#pragma Delegate function
- (void)groupSelectionDidCancel{
    
}

- (void)groupSelectionDidSelect:(NSString *)prayerGroup{
    [groupButton setTitle:prayerGroup forState:UIControlStateNormal];
}
@end
