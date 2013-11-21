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
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:143.0/255.0 green:91.0/255.0 blue:79.0/255.0 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    if (prayListTableView == nil){
        prayListTableView = [[UITableView alloc] init];
    }
    
    [prayListTableView registerClass:[PAPrayListTableViewCell class] forCellReuseIdentifier:@"CellI"];
    [[PAPrayerService shareInstance] getPrayerList:@"1" success:^(PANetWorking *service, id responseObject) {
        prayerItemList = responseObject;
        
        NSLog(@"%@", prayerItemList);
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
    
    [cell updateWithPrayer:[prayerItemList objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard* mainStoryBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
                                    
    PAPrayerDetailViewController* prayerDetailVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"PAPrayerDetailViewController"];//[[PAPrayerDetailViewController alloc] init];
    [self.navigationController pushViewController:prayerDetailVC animated:YES];
    [prayerDetailVC updateWithPrayerItem:[prayerItemList objectAtIndex:indexPath.row]];

}
@end
