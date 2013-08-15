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
@interface PAHomeViewController ()

@end

@implementation PAHomeViewController
@synthesize prayListTableView;
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
    
    if (prayListTableView == nil){
        NSLog(@"asdf");
        prayListTableView = [[UITableView alloc] init];
    }
    
    [prayListTableView registerClass:[PAPrayListTableViewCell class] forCellReuseIdentifier:@"CellI"];
    
//    UILabel* testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 00, 320, 60)];
//    testLabel.text = @"Test";
//    
//    [self.view addSubview:testLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
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
    prayItme.prayerContext = @"asdfas dfas";
//    prayItme.prayerID = [];
    [cell updateWithPrayer:prayItme];
    
    return cell;
}
@end
