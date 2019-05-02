//
//  AuthorizationViewController.m
//  DropboxClient
//
//  Created by Chemersky on 7/14/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import "AuthorizationViewController.h"
#import <ObjectiveDropboxOfficial/ObjectiveDropboxOfficial.h>

@interface AuthorizationViewController ()

@end

@implementation AuthorizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAuthorizeView];
}

#pragma mark -

- (void)loadAuthorizeView {
    [DBClientsManager setupWithAppKey:@"d9d9qdu71zeypzy"];
    [DBClientsManager authorizeFromController:[UIApplication sharedApplication]
                controller:self
                openURL:^(NSURL *url) {
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                }
    ];
}

@end
