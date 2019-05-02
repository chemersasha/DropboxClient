//
//  LoadingScreenViewController.m
//  DropboxClient
//
//  Created by Chemersky on 7/16/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import "LoadingScreenViewController.h"
#import "UIViewController+Navigation.h"

@interface LoadingScreenViewController ()

@end

@implementation LoadingScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self removeBackButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
