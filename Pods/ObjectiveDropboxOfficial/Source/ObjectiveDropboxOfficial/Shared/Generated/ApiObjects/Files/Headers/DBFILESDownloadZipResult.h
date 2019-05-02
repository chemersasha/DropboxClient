///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESDownloadZipResult;
@class DBFILESFolderMetadata;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `DownloadZipResult` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESDownloadZipResult : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// (no description).
@property (nonatomic, readonly) DBFILESFolderMetadata *metadata;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param metadata (no description).
///
/// @return An initialized instance.
///
- (instancetype)initWithMetadata:(DBFILESFolderMetadata *)metadata;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DownloadZipResult` struct.
///
@interface DBFILESDownloadZipResultSerializer : NSObject

///
/// Serializes `DBFILESDownloadZipResult` instances.
///
/// @param instance An instance of the `DBFILESDownloadZipResult` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESDownloadZipResult` API object.
///
+ (nullable NSDictionary *)serialize:(DBFILESDownloadZipResult *)instance;

///
/// Deserializes `DBFILESDownloadZipResult` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESDownloadZipResult` API object.
///
/// @return An instantiation of the `DBFILESDownloadZipResult` object.
///
+ (DBFILESDownloadZipResult *)deserialize:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
