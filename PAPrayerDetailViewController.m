//
//  PAPrayerDetailViewController.m
//  prayApp
//
//  Created by Jeff Wang on 8/16/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayerDetailViewController.h"

@interface PAPrayerDetailViewController ()

@end

@implementation PAPrayerDetailViewController
@synthesize prayerDetailLabel, prayerGroupLabel, prayerItem, prayerTitleLabel, lastUpdatedLabel;

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
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"tsk %@", prayerTitleLabel.text);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateWithPrayerItem:(PAPrayer*)prayer{
    self.prayerItem = prayer;
    NSLog(@"hmmm %@", prayerTitleLabel.text);
    prayerDetailLabel.text = self.prayerItem.prayerContext;
    prayerTitleLabel.text = self.prayerItem.prayerTitle;
    prayerGroupLabel.text = self.prayerItem.groupName;
    
    
    NSLog(@"ASHFAHSDF : %@", prayer.prayerTitle);
    
}
@end
