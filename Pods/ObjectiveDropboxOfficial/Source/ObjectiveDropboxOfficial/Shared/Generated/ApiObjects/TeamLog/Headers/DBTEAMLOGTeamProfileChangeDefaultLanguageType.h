///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGTeamProfileChangeDefaultLanguageType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `TeamProfileChangeDefaultLanguageType` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGTeamProfileChangeDefaultLanguageType : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// (no description).
@property (nonatomic, readonly, copy) NSString *description_;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param description_ (no description).
///
/// @return An initialized instance.
///
- (instancetype)initWithDescription_:(NSString *)description_;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `TeamProfileChangeDefaultLanguageType`
/// struct.
///
@interface DBTEAMLOGTeamProfileChangeDefaultLanguageTypeSerializer : NSObject

///
/// Serializes `DBTEAMLOGTeamProfileChangeDefaultLanguageType` instances.
///
/// @param instance An instance of the
/// `DBTEAMLOGTeamProfileChangeDefaultLanguageType` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGTeamProfileChangeDefaultLanguageType` API object.
///
+ (nullable NSDictionary *)serialize:(DBTEAMLOGTeamProfileChangeDefaultLanguageType *)instance;

///
/// Deserializes `DBTEAMLOGTeamProfileChangeDefaultLanguageType` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGTeamProfileChangeDefaultLanguageType` API object.
///
/// @return An instantiation of the
/// `DBTEAMLOGTeamProfileChangeDefaultLanguageType` object.
///
+ (DBTEAMLOGTeamProfileChangeDefaultLanguageType *)deserialize:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
