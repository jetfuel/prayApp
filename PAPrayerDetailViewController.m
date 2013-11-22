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
        prayerTitleLabel.font = [UIFont fontWithName:@"OpenSans" size:20];
        prayerGroupLabel.font = [UIFont fontWithName:@"OpenSans-Regular" size:12];
        prayerDetailLabel.font = [UIFont fontWithName:@"OpenSans" size:14];

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
    
    [prayerDetailView addSubview:prayerTitleLabel];
    [prayerDetailView addSubview:prayerGroupLabel];
    [prayerDetailView addSubview:prayerDetailLabel];
    
    [contentTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [contentTableView setBackgroundColor:[UIColor colorWithRed:(242.0f/255.0f) green:(242.0f/255.0f) blue:(242.0f/255.0f) alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateWithPrayerItem:(PAPrayer*)prayer{
    self.prayerItem = prayer;
    
    prayerTitleLabel.text = self.prayerItem.prayerTitle;
    prayerGroupLabel.text = [NSString stringWithFormat:@"%@ in %@", [self.prayerItem.userNameString uppercaseString],[self.prayerItem.groupName uppercaseString]];
    NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:prayerGroupLabel.text];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"OpenSans-semibold" size:12] range:[prayerGroupLabel.text rangeOfString:[self.prayerItem.userNameString uppercaseString]]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"OpenSans" size:12] range:[prayerGroupLabel.text rangeOfString:@" in "]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"OpenSans-semibold" size:12] range:[prayerGroupLabel.text rangeOfString:[self.prayerItem.groupName uppercaseString]]];
    prayerGroupLabel.attributedText = attributedString;
    prayerGroupLabel.textColor = [UIColor grayColor];

    prayerDetailLabel.text = self.prayerItem.prayerContext;

    descriptionImageView.image = [UIImage imageNamed:@"pray_detail_icon_example.png"];
//    descriptionImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, descriptionImageView.image.size.height);
    [self updateprayerDetailViewLayout];
    isLoadingChats = YES;
    [contentTableView reloadData];
}

- (void)updateprayerDetailViewLayout{
    float labelWidth = self.view.bounds.size.width - 2 * kLeftMargin;
    prayerTitleLabel.frame = CGRectMake(kLeftMargin, kTopMargin, labelWidth, 40);
    [prayerTitleLabel setNumberOfLines:0];
    [prayerTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [prayerTitleLabel sizeToFit];
    
    prayerGroupLabel.frame = CGRectMake(kLeftMargin, prayerTitleLabel.frame.origin.y + prayerTitleLabel.frame.size.height + kTopMargin, labelWidth, 40);
    [prayerGroupLabel setNumberOfLines:0];
    [prayerGroupLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [prayerGroupLabel sizeToFit];
    
    prayerDetailLabel.frame = CGRectMake(kLeftMargin, prayerGroupLabel.frame.origin.y + prayerGroupLabel.frame.size.height + kTopMargin, labelWidth, 40);
    [prayerDetailLabel setNumberOfLines:0];
    [prayerDetailLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [prayerDetailLabel sizeToFit];
    
    prayerDetailView.frame = CGRectMake(0, 0, self.view.bounds.size.width, prayerDetailLabel.frame.origin.y + prayerDetailLabel.frame.size.height + kTopMargin);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0){
//        return [UIImage imageNamed:@"pray_detail_icon_example.png"].size.height;
//    }
//    else if (indexPath.row == 1){
//        return prayerDetailView.frame.size.height;
//    }
    if (indexPath.row == 0){
        return prayerDetailView.frame.size.height;
    }
    else if (indexPath.row == 1){
        if (isLoadingChats)
            return 40;
        else
            return 0;
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

//    if (indexPath.row == 0){
//        descriptionImageView.image = [UIImage imageNamed:@"pray_detail_icon_example.png"];
//        descriptionImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, descriptionImageView.image.size.height);
//        [cell.contentView addSubview:descriptionImageView];
//    }
//    else if (indexPath.row == 1){
    if (indexPath.row == 0){
        [cell.contentView addSubview:prayerDetailView];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    else{
        if (loadingChatIndicator == nil){
            loadingChatIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [loadingChatIndicator startAnimating];
            [loadingChatIndicator setHidesWhenStopped:YES];
            loadingChatIndicator.center = cell.contentView.center;
            [cell.contentView addSubview:loadingChatIndicator];
            
            [cell.contentView setBackgroundColor:[UIColor colorWithRed:(242.0f/255.0f) green:(242.0f/255.0f) blue:(242.0f/255.0f) alpha:1]];
        }
    }
    return cell;
}
@end
