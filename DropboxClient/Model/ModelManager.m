//
//  ModelManager.m
//  DropboxClient
//
//  Created by Chemersky on 7/14/18.
//  Copyright © 2018 Chemer. All rights reserved.
//

#import "ModelManager.h"
#import "AppDelegate.h"
#import "Metadata+CoreDataClass.h"
#import <ObjectiveDropboxOfficial/ObjectiveDropboxOfficial.h>

NSString * const kFileIconDidReceive = @"kFileIconDidReceive";
NSString * const kFileIdKey = @"kFileIdKey";
NSString * const kRootFolderId = @"kRootFolderIdkRootFolderId";

@interface ModelManager()
@property (copy) void (^updateModelWithCompletion)(void);
@property unsigned int entriesLoadingCount;
@end


@implementation ModelManager

- (NSArray *)fileListWithParent:(NSString *)parentId {
    NSArray *result;
    
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Metadata"];
    request.predicate = [NSPredicate predicateWithFormat:@"parentId == %@", parentId];
    result = [context executeFetchRequest:request error:&error];
    if (error) {
        //@TODO handle error
    }
    return result;
}

- (void)updateModelWithCompletionHandler:(void(^)(void))completion {
    self.updateModelWithCompletion = completion;
    self.entriesLoadingCount = 0;
    
    [self addObserver:self forKeyPath:@"entriesLoadingCount" options:0 context:NULL];
    
    [self listFolder:@"" parentId:kRootFolderId];
}

- (void)listFolder:(NSString *)path parentId:(NSString *)parentId {
    DBUserClient *client = [DBClientsManager authorizedClient];
    
    self.entriesLoadingCount++;
    [[client.filesRoutes listFolder:path] setResponseBlock:^(DBFILESListFolderResult *response, DBFILESListFolderError *routeError, DBRequestError *networkError) {
        if (response) {
            NSArray<DBFILESMetadata *> *entries = response.entries;
            [self saveEntries:entries parent:parentId];
            
            NSString *cursor = response.cursor;
            BOOL hasMore = [response.hasMore boolValue];
            if (hasMore) {
                [self listFolderContinueWithClient:client cursor:cursor parent:kRootFolderId];
            } else {
                for (DBFILESFolderMetadata *entry in entries) {
                    if ([entry isKindOfClass:[DBFILESFolderMetadata class]]) {
                        [self listFolder:entry.pathLower parentId:entry.id_];
                    }
                }
                NSLog(@"List folder complete.");
            }
        } else {
            NSLog(@"%@\n%@\n", routeError, networkError);
        }
        self.entriesLoadingCount--;
    }];
}

- (void)listFolderContinueWithClient:(DBUserClient *)client cursor:(NSString *)cursor parent:(NSString *)parentId {
    self.entriesLoadingCount++;
    [[client.filesRoutes listFolderContinue:cursor] setResponseBlock:^(DBFILESListFolderResult *response, DBFILESListFolderContinueError *routeError, DBRequestError *networkError) {
        if (response) {
            NSArray<DBFILESMetadata *> *entries = response.entries;
            [self saveEntries:entries parent:parentId];

            NSString *cursor = response.cursor;
            BOOL hasMore = [response.hasMore boolValue];
            if (hasMore) {
                [self listFolderContinueWithClient:client cursor:cursor parent:parentId];
            } else {
                NSLog(@"List folder complete.");
            }
        } else {
            NSLog(@"%@\n%@\n", routeError, networkError);
        }
        self.entriesLoadingCount--;
    }];
}

#pragma mark -

- (void)saveEntries:(NSArray<DBFILESMetadata *> *)entries parent:(NSString *)parentId {
    for (DBFILESMetadata *entry in entries) {
        if ([entry isKindOfClass:[DBFILESFileMetadata class]]) {
           [self saveFileEntry:(DBFILESFileMetadata *)entry parent:parentId];
        } else if ([entry isKindOfClass:[DBFILESFolderMetadata class]]) {
            [self saveFolderEntry:(DBFILESFolderMetadata *)entry parent:parentId];
        } else if ([entry isKindOfClass:[DBFILESDeletedMetadata class]]) {
            DBFILESDeletedMetadata *deletedMetadata = (DBFILESDeletedMetadata *)entry;
            NSLog(@"Deleted data: %@\n", deletedMetadata);
        }
    }
}

- (void)saveFileEntry:(DBFILESFileMetadata *)entry parent:(NSString *)parentId {
    DBFILESFileMetadata *fileMetadata = entry;
NSLog(@"File data: %@\n", fileMetadata);
    DBUserClient *client = [DBClientsManager authorizedClient];
    DBDownloadDataTask *task = [client.filesRoutes getThumbnailData:fileMetadata.pathLower];

    Metadata *file = [self createMetadata];
    file.name = fileMetadata.name;
    file.id_ = fileMetadata.id_;
    file.parentId = parentId;
    file.isFolder = NO;

    self.entriesLoadingCount++;
    [task setResponseBlock:^(id _Nullable result, id _Nullable routeError, DBRequestError * _Nullable networkError, NSData * _Nullable fileData) {
        if (fileData) {
            file.thumbnail = fileData;
        }
        self.entriesLoadingCount--;
        //@TODO doesn't show files list now (remove notification)
        [[NSNotificationCenter defaultCenter] postNotificationName:kFileIconDidReceive object:nil userInfo:@{kFileIdKey:file.id_}];
    }];
}

- (void)saveFolderEntry:(DBFILESFolderMetadata *)entry parent:(NSString *)parentId {
    DBFILESFolderMetadata *folderMetadata = entry;
NSLog(@"Folder data: %@\n", folderMetadata);

    Metadata *folder = [self createMetadata];
    folder.name = folderMetadata.name;
    folder.id_ = folderMetadata.id_;
    folder.parentId = parentId;
    folder.thumbnail = UIImagePNGRepresentation([UIImage imageNamed:@"iconfolder"]);
    folder.isFolder = YES;
}

#pragma mark -

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"entriesLoadingCount"]) {
        if(self.entriesLoadingCount == 0) {
            self.updateModelWithCompletion();
            self.updateModelWithCompletion = nil;
            
            [self removeObserver:self forKeyPath:@"entriesLoadingCount"];
        }
    }
}

#pragma mark -

- (Metadata *)createMetadata {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    return [NSEntityDescription insertNewObjectForEntityForName:@"Metadata" inManagedObjectContext:context];
}

#pragma mark -

- (NSPersistentContainer *)persistentContainer {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer;
}

@end
