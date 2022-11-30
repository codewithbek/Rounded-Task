// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSocial _$UserSocialFromJson(Map<String, dynamic> json) => UserSocial(
      instagramUsername: json['instagram_username'],
      portfolioUrl: json['portfolio_url'],
      twitterUsername: json['twitter_username'] as String? ?? '',
      paypalEmail: json['paypal_email'],
    );

Map<String, dynamic> _$UserSocialToJson(UserSocial instance) =>
    <String, dynamic>{
      'instagram_username': instance.instagramUsername,
      'portfolio_url': instance.portfolioUrl,
      'paypal_email': instance.paypalEmail,
      'twitter_username': instance.twitterUsername,
    };
