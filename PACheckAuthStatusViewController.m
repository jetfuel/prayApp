//
//  PACheckAuthStatusViewController.m
//  prayApp
//
//  Created by Jeff Wang on 12/10/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PACheckAuthStatusViewController.h"
#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>
#import "PAHomeViewController.h"
#import <FacebookSDK/FacebookSDK.h>

#define kFireBaseURL @"https://praylist.firebaseio.com/"
@interface PACheckAuthStatusViewController ()

@end

@implementation PACheckAuthStatusViewController

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
    [super viewDidAppear:animated];
    
    activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    activityIndicatorView.center = self.view.center;
    activityIndicatorView.hidesWhenStopped = YES;
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    [self authCheck];
    self.view.backgroundColor = [UIColor colorWithRed:143.0/255.0 green:91.0/255.0 blue:79.0/255.0 alpha:1];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)authCheckComplete{
    UIStoryboard *myBookStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
    UINavigationController* homeVC = [myBookStoryboard instantiateInitialViewController];
    
    [self presentViewController:homeVC animated:YES completion:^{
        ;
    }];
}
- (void)authCheck{
    // Create a reference to a Firebase location
    Firebase* ref = [[Firebase alloc] initWithUrl:@"https://praylist.firebaseio.com/"];
    FirebaseSimpleLogin* authClient = [[FirebaseSimpleLogin alloc] initWithRef:ref];
    [authClient checkAuthStatusWithBlock:^(NSError* error, FAUser* user) {
        if (error != nil) {
            NSLog(@"Oh no! There was an error performing the check");
        } else if (user == nil) {
            [activityIndicatorView stopAnimating];
            UIButton* loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [loginBtn setTitle:@"Log in with facebook" forState:UIControlStateNormal];
            loginBtn.frame = CGRectMake(0, 0, 200, 44);
            loginBtn.center = activityIndicatorView.center;
            loginBtn.backgroundColor = [UIColor blueColor];
            [self.view addSubview:loginBtn];
            [loginBtn addTarget:self action:@selector(loginToFaceBook) forControlEvents:UIControlEventTouchUpInside];
        } else {
            NSLog(@"There is a logged in user - %@", user.userId);
            [self authCheckComplete];
        }
    }];
}

- (void)loginToFaceBook{
    Firebase* ref = [[Firebase alloc] initWithUrl:@"https://praylist.firebaseio.com/"];
    FirebaseSimpleLogin* authClient = [[FirebaseSimpleLogin alloc] initWithRef:ref];

    [authClient loginToFacebookAppWithId:@"244636579034958" permissions:@[@"email"]
                                audience:ACFacebookAudienceOnlyMe
                     withCompletionBlock:^(NSError *error, FAUser *user) {
                         if (error != nil) {
                             NSLog(@"There was an error logging in: %@", error);
                         } else {
                             NSLog(@"We have a logged in facebook user");
                             // Ok, user logged into the facebook.We will need to get some basic infomation
                             [self requestEmailFromFacebook:user];
                         }
                     }];

}

- (void)requestEmailFromFacebook:(FAUser*)fUser{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
            if (!error) {
                userName = user.name;
                userEmail = [user objectForKey:@"email"];
                
                Firebase* userRef = [[Firebase alloc] initWithUrl:[NSString stringWithFormat:@"%@/users/%@", kFireBaseURL, fUser.userId]];
                [userRef setValue:@{@"name":userName, @"email":userEmail} withCompletionBlock:^(NSError *error, Firebase *ref) {
                    if (error != nil){
                        NSLog(@"encounter error while adding a new user: %@", error);
                    }
                    else{
                        // user added successfully to the server.
                        [self authCheckComplete];
                    }
                }];
            }
        }];
    }
}
@end
