//
//  PAPrayerDetailViewController.m
//  prayApp
//
//  Created by Jeff Wang on 8/16/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayerDetailViewController.h"

#define kLeftMargin 20
#define kTopMargin 10
@interface PAPrayerDetailViewController ()

@end

@implementation PAPrayerDetailViewController
@synthesize prayerDetailLabel, prayerGroupLabel, prayerItem, prayerTitleLabel, lastUpdatedLabel, contentTableView, descriptionImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        descriptionImageView = [[UIImageView alloc] init];
        
        prayerDetailView = [[UIView alloc] init];
        prayerTitleLabel = [[UILabel alloc] init];
        prayerGroupLabel = [[UILabel alloc] init];
        prayerDetailLabel = [[UILabel alloc] init];
        prayerTitleLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:12];
        prayerGroupLabel.font = [UIFont fontWithName:@"OpenSans-Regular" size:12];
        prayerDetailLabel.font = [UIFont fontWithName:@"OpenSans-Light" size:12];

        
        [prayerDetailView addSubview:prayerTitleLabel];
        [prayerDetailView addSubview:prayerGroupLabel];
        [prayerDetailView addSubview:prayerDetailLabel];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Custom initialization
    descriptionImageView = [[UIImageView alloc] init];
    
    float labelWidth = self.view.bounds.size.width - 2 * kLeftMargin;
    prayerDetailView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    prayerTitleLabel.frame = CGRectMake(kLeftMargin, kTopMargin, labelWidth, 40);
    prayerGroupLabel.frame = CGRectMake(kLeftMargin, prayerTitleLabel.frame.origin.y + prayerTitleLabel.frame.size.height, labelWidth, 40);
    prayerDetailLabel.frame = CGRectMake(kLeftMargin, prayerGroupLabel.frame.origin.y + prayerGroupLabel.frame.size.height, labelWidth, 40);
    
    [prayerDetailView addSubview:prayerTitleLabel];
    [prayerDetailView addSubview:prayerGroupLabel];
    [prayerDetailView addSubview:prayerDetailLabel];
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
    prayerGroupLabel.text = [self.prayerItem.groupName uppercaseString];
    
    descriptionImageView.image = [UIImage imageNamed:@"pray_detail_icon_example.png"];
    descriptionImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, descriptionImageView.image.size.height);

    [contentTableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        return [UIImage imageNamed:@"pray_detail_icon_example.png"].size.height;
    }
    else if (indexPath.row == 1){
        return 200;
    }
    else
        return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    if (indexPath.row == 0){
        descriptionImageView.image = [UIImage imageNamed:@"pray_detail_icon_example.png"];
        descriptionImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, descriptionImageView.image.size.height);
        [cell.contentView addSubview:descriptionImageView];
    }
    else if (indexPath.row == 1){
        [cell.contentView addSubview:prayerDetailView];
    }
    return cell;
    
}
@end
