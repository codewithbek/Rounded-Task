// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String? ?? '',
      acceptedTos: json['accepted_tos'] as bool? ?? false,
      bio: json['bio'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      forHire: json['for_hire'] as bool? ?? false,
      lastName: json['last_name'] as String? ?? '',
      links: UserLinks.fromJson(json['links'] as Map<String, dynamic>),
      location: json['location'] as String? ?? '',
      name: json['name'] as String? ?? '',
      portfolioUrl: json['portfolio_url'] as String? ?? '',
      profileImage:
          ProfileImage.fromJson(json['profile_image'] as Map<String, dynamic>),
      social: UserSocial.fromJson(json['social'] as Map<String, dynamic>),
      totalCollections: json['total_collections'] as int? ?? 0,
      totalLikes: json['total_likes'] as int? ?? 0,
      totalPhotos: json['total_photos'] as int? ?? 0,
      twitterUsername: json['twitter_username'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      username: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'username': instance.username,
      'name': instance.name,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'twitter_username': instance.twitterUsername,
      'portfolio_url': instance.portfolioUrl,
      'bio': instance.bio,
      'location': instance.location,
      'links': instance.links,
      'profile_image': instance.profileImage,
      'social': instance.social,
      'total_collections': instance.totalCollections,
      'total_likes': instance.totalLikes,
      'total_photos': instance.totalPhotos,
      'accepted_tos': instance.acceptedTos,
      'for_hire': instance.forHire,
    };
