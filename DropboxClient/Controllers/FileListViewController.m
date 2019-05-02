//
//  FileListViewController.m
//  DropboxClient
//
//  Created by Chemersky on 7/14/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import "FileListViewController.h"
#import "FileTableViewCell.h"
#import "ModelManager.h"
#import "Metadata+CoreDataClass.h"
#import "UIViewController+Navigation.h"

@interface FileListViewController ()
@property (nonatomic, strong) NSArray <Metadata *> *list;
@end

@implementation FileListViewController

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iconDidReceive:) name:kFileIconDidReceive object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.parentId isEqualToString:kRootFolderId]) {
        [self removeBackButton];
    }

    ModelManager *modelManager = [ModelManager new];
    self.list = [modelManager fileListWithParent:self.parentId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fileListCell" forIndexPath:indexPath];
    
    Metadata *metadata = self.list[indexPath.row];
    cell.nameLabel.text = metadata.name;
    cell.iconImageView.image = (metadata.thumbnail) ?
                [UIImage imageWithData:metadata.thumbnail] :
                [UIImage imageNamed:@"iconnoimage"];
    if (metadata.isFolder) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(self.list[indexPath.row].isFolder) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        FileListViewController *fileListViewController = [storyBoard instantiateViewControllerWithIdentifier:@"fileListTableViewId"];
        
        fileListViewController.parentId = self.list[indexPath.row].id_;
        [self.navigationController pushViewController:fileListViewController animated:YES];
    }
}

#pragma mark -

- (void)reloadItemWithFileId:(NSString *)fileId {
    NSArray <NSIndexPath *> *rowsToReload = [NSArray arrayWithObjects:[self indexPathAtFileId:fileId], nil];
    [self.tableView reloadRowsAtIndexPaths:rowsToReload withRowAnimation:UITableViewRowAnimationNone];
}

- (NSIndexPath *)indexPathAtFileId:(NSString *)fileId {
    NSIndexPath *result;
    for (Metadata *file in self.list) {
        if ([file.id_ isEqualToString:fileId]) {
            result = [NSIndexPath indexPathForRow:[self.list indexOfObject:file] inSection:0];
        }
    }
    return result;
}

#pragma mark - Notifications handler

- (void)iconDidReceive:(NSNotification *)notification {
    NSString *fileId = [notification.userInfo objectForKey:kFileIdKey];
    [self reloadItemWithFileId:fileId];
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
