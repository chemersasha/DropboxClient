//
//  UIViewController+Navigation.m
//  DropboxClient
//
//  Created by Chemersky on 7/14/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (void)removeBackButton {
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
}

@end
