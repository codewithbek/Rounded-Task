// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLinks _$UserLinksFromJson(Map<String, dynamic> json) => UserLinks(
      self: json['self'] as String? ?? '',
      html: json['html'] as String? ?? '',
      photos: json['photos'] as String? ?? '',
      likes: json['likes'] as String? ?? '',
      portfolio: json['portfolio'] as String? ?? '',
      followers: json['followers'] as String? ?? '',
      following: json['following'] as String? ?? '',
    );

Map<String, dynamic> _$UserLinksToJson(UserLinks instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
      'portfolio': instance.portfolio,
      'following': instance.following,
      'followers': instance.followers,
    };
