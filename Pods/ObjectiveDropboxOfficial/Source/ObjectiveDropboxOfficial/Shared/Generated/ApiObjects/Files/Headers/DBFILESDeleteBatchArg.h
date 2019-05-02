///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESDeleteArg;
@class DBFILESDeleteBatchArg;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `DeleteBatchArg` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESDeleteBatchArg : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// (no description).
@property (nonatomic, readonly) NSArray<DBFILESDeleteArg *> *entries;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param entries (no description).
///
/// @return An initialized instance.
///
- (instancetype)initWithEntries:(NSArray<DBFILESDeleteArg *> *)entries;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DeleteBatchArg` struct.
///
@interface DBFILESDeleteBatchArgSerializer : NSObject

///
/// Serializes `DBFILESDeleteBatchArg` instances.
///
/// @param instance An instance of the `DBFILESDeleteBatchArg` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESDeleteBatchArg` API object.
///
+ (nullable NSDictionary *)serialize:(DBFILESDeleteBatchArg *)instance;

///
/// Deserializes `DBFILESDeleteBatchArg` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESDeleteBatchArg` API object.
///
/// @return An instantiation of the `DBFILESDeleteBatchArg` object.
///
+ (DBFILESDeleteBatchArg *)deserialize:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
