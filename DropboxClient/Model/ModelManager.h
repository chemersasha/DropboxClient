//
//  ModelManager.h
//  DropboxClient
//
//  Created by Chemersky on 7/14/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelManager : NSObject
- (NSArray *)fileListWithParent:(NSString *)parentId;
- (void)updateModelWithCompletionHandler:(void(^)(void))completion;
@end

extern NSString * const kFileIconDidReceive;
extern NSString * const kFileIdKey;
extern NSString * const kRootFolderId;
