// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopLevelModel _$TopLevelModelFromJson(Map<String, dynamic> json) =>
    TopLevelModel(
      blurHash: json['blur_hash'] as String? ?? '',
      id: json['id'] as String? ?? '',
      color: json['color'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      downloads: json['downloads'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      width: json['width'] as int? ?? 0,
      likedByUser: json['liked_by_user'] as bool? ?? false,
      likes: json['likes'] as int? ?? 0,
      links: UserLinks.fromJson(json['links'] as Map<String, dynamic>),
      promotedAt: json['promoted_at'] as String? ?? '',
      publicDomain: json['public_domain'] as bool? ?? false,
      totalLikes: json['total_likes'] as int? ?? 0,
      updatedAt: json['updated_at'] as String? ?? '',
      urlsModel: UrlsModel.fromJson(json['urls'] as Map<String, dynamic>),
      userModel: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      views: json['views'] as int? ?? 0,
    );

Map<String, dynamic> _$TopLevelModelToJson(TopLevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'promoted_at': instance.promotedAt,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'urls': instance.urlsModel,
      'user': instance.userModel,
      'links': instance.links,
      'likes': instance.likes,
      'total_likes': instance.totalLikes,
      'views': instance.views,
      'downloads': instance.downloads,
      'public_domain': instance.publicDomain,
      'liked_by_user': instance.likedByUser,
    };
