///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGSfTeamInviteChangeRoleDetails;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `SfTeamInviteChangeRoleDetails` struct.
///
/// Changed team member's role in shared folder.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGSfTeamInviteChangeRoleDetails : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// Target asset position in the Assets list.
@property (nonatomic, readonly) NSNumber *targetAssetIndex;

/// Original shared folder name.
@property (nonatomic, readonly, copy) NSString *originalFolderName;

/// New sharing permission. Might be missing due to historical data gap.
@property (nonatomic, readonly, copy, nullable) NSString *dNewSharingPermission;

/// Previous sharing permission. Might be missing due to historical data gap.
@property (nonatomic, readonly, copy, nullable) NSString *previousSharingPermission;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param targetAssetIndex Target asset position in the Assets list.
/// @param originalFolderName Original shared folder name.
/// @param dNewSharingPermission New sharing permission. Might be missing due to
/// historical data gap.
/// @param previousSharingPermission Previous sharing permission. Might be
/// missing due to historical data gap.
///
/// @return An initialized instance.
///
- (instancetype)initWithTargetAssetIndex:(NSNumber *)targetAssetIndex
                      originalFolderName:(NSString *)originalFolderName
                   dNewSharingPermission:(nullable NSString *)dNewSharingPermission
               previousSharingPermission:(nullable NSString *)previousSharingPermission;

///
/// Convenience constructor (exposes only non-nullable instance variables with
/// no default value).
///
/// @param targetAssetIndex Target asset position in the Assets list.
/// @param originalFolderName Original shared folder name.
///
/// @return An initialized instance.
///
- (instancetype)initWithTargetAssetIndex:(NSNumber *)targetAssetIndex originalFolderName:(NSString *)originalFolderName;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `SfTeamInviteChangeRoleDetails` struct.
///
@interface DBTEAMLOGSfTeamInviteChangeRoleDetailsSerializer : NSObject

///
/// Serializes `DBTEAMLOGSfTeamInviteChangeRoleDetails` instances.
///
/// @param instance An instance of the `DBTEAMLOGSfTeamInviteChangeRoleDetails`
/// API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGSfTeamInviteChangeRoleDetails` API object.
///
+ (nullable NSDictionary *)serialize:(DBTEAMLOGSfTeamInviteChangeRoleDetails *)instance;

///
/// Deserializes `DBTEAMLOGSfTeamInviteChangeRoleDetails` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGSfTeamInviteChangeRoleDetails` API object.
///
/// @return An instantiation of the `DBTEAMLOGSfTeamInviteChangeRoleDetails`
/// object.
///
+ (DBTEAMLOGSfTeamInviteChangeRoleDetails *)deserialize:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
