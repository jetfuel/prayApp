//
//  PAHomeViewController.m
//  prayApp
//
//  Created by Jeff Wang on 8/13/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAHomeViewController.h"
#import "PAPrayer.h"
#import "PAPrayListTableViewCell.h"
#import "PAPrayerDetailViewController.h"
#import "PAPrayerService.h"

@interface PAHomeViewController ()

@end

@implementation PAHomeViewController
@synthesize prayListTableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        prayerItemList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (prayListTableView == nil){
        NSLog(@"asdf");
        prayListTableView = [[UITableView alloc] init];
    }
    
    [prayListTableView registerClass:[PAPrayListTableViewCell class] forCellReuseIdentifier:@"CellI"];
    [[PAPrayerService shareInstance] getPrayerList:@"1" success:^(PANetWorking *service, id responseObject) {
        prayerItemList = responseObject;
        [prayListTableView reloadData];
    } failure:^(PANetWorking *service, NSError *error) {
        ;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [prayerItemList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PAPrayListTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellI" forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[PAPrayListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellI"];
    }
    
    PAPrayer* prayItme = [[PAPrayer alloc] init];
    prayItme.prayerTitle = @"Pray for health";
    prayItme.prayerContext = @"Pter Lin in Family";
    [cell updateWithPrayer:prayItme];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PAPrayerDetailViewController* prayerDetailVC = [[PAPrayerDetailViewController alloc] init];
    
    [self.navigationController pushViewController:prayerDetailVC animated:YES];
}
@end
