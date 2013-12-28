//
//  PAGroupSelectionViewController.m
//  prayApp
//
//  Created by Jeff Wang on 12/27/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAGroupSelectionViewController.h"

@interface PAGroupSelectionViewController ()

@end

@implementation PAGroupSelectionViewController
@synthesize prayerGroupList, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init{
    self = [super init];
    if (self){
        prayerGroupTableView = [[UITableView alloc] init];
        prayerGroupTableView.delegate = self;
        prayerGroupTableView.dataSource = self;
        prayerGroupList = [[NSMutableArray alloc] init];
        selectedGroupIndex = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    prayerGroupTableView.frame = self.view.bounds;
    
    [self.view addSubview:prayerGroupTableView];
    self.title = @"Prayer Groups";
    
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelSelection:)];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneSelection:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)cancelSelection:(id)sender{
    [delegate groupSelectionDidCancel];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)doneSelection:(id)sender{
    [delegate groupSelectionDidSelect:[prayerGroupList objectAtIndex:selectedGroupIndex]];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [prayerGroupList objectAtIndex:indexPath.row];
    if (indexPath.row == selectedGroupIndex)
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    else
        [cell setAccessoryType:UITableViewCellAccessoryNone];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // remove the selected background color
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    [[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedGroupIndex inSection:0]] setAccessoryType:UITableViewCellAccessoryNone];

    selectedGroupIndex = indexPath.row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [prayerGroupList count];
}

@end
