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
#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>
#import "PAUser.h"
#import "PAAddPrayerViewController.h"
#import "PAGlobalNavigationController.h"
@interface PAHomeViewController (){
    UIBarButtonItem* addPrayerButton;
}

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
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:143.0/255.0 green:91.0/255.0 blue:79.0/255.0 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    if (prayListTableView == nil){
        prayListTableView = [[UITableView alloc] init];
    }
    
    if (prayerItemList == nil)
        prayerItemList = [[NSMutableArray alloc] init];
    
    [prayListTableView registerClass:[PAPrayListTableViewCell class] forCellReuseIdentifier:@"CellI"];
//    [[PAPrayerService shareInstance] getPrayerList:@"1" success:^(PANetWorking *service, id responseObject) {
//        [prayerItemList addObjectsFromArray:responseObject];//responseObject;
//        
//        NSLog(@"%@", prayerItemList);
//        [prayListTableView reloadData];
//    } failure:^(PANetWorking *service, NSError *error) {
//        ;
//    }];
    
    // Create a reference to a Firebase location
    Firebase* ref = [[Firebase alloc] initWithUrl:@"https://praylist.firebaseio.com/users/demo-user"];
    [ref observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        if (snapshot.value == nil){
            NSLog(@"no such user");
        }
        else{
            PAUser* theUser = [[PAUser alloc] initWithDict:snapshot.value];
            theUser.userID = @"demo-user";
            prayerGroupList = theUser.groupList;
            [self fetchPrayerDetails:theUser];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// read the prayers from the server
- (void)fetchPrayerDetails:(PAUser*)user{
    NSArray* prayerList = user.prayerList;
    
    // Need to go through the whole list.... is there is better way to do this?
    for (int i = 0; i < prayerList.count; i++) {
        NSString* prayerID = [prayerList objectAtIndex:i];
        Firebase* ref = [[PAPrayerService getFireBasePrayerRef] childByAppendingPath:prayerID];
        [ref observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
            if (snapshot.value != [NSNull null]){
                PAPrayer* prayItem = [[PAPrayer alloc] initWithDictionary:snapshot.value];
                prayItem.prayerID = prayerID;
                prayItem.userNameString = user.userName;
                [prayerItemList addObject:prayItem];
                
                [prayListTableView reloadData];
            }
        }];
    }
}

//- (IBAction) addPrayer:(UIBarButtonItem*)addButton{
//    PAAddPrayerViewController* addPrayerViewController = [[PAAddPrayerViewController alloc] init];
//    NSLog(@"???? %@", prayerGroupList);
//
//    [self.navigationController pushViewController:addPrayerViewController animated:YES];
//}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"addNewPrayer"]){
        PAAddPrayerViewController* addPrayerViewController = [segue destinationViewController];
        addPrayerViewController.prayerGroupList = prayerGroupList;
    }
}
// TableView delegate and database
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

- (IBAction) openMenu:(id)sender{
    [((PAGlobalNavigationController*)self.navigationController) toggleMenu];
}

@end
