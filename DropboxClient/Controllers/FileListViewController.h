//
//  FileListViewController.h
//  DropboxClient
//
//  Created by Chemersky on 7/14/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileListViewController : UITableViewController
@property (nonatomic, strong) NSString *parentId;
@end