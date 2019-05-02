//
//  FileTableViewCell.h
//  DropboxClient
//
//  Created by Chemersky on 7/14/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
