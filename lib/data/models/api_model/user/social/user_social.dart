import 'package:json_annotation/json_annotation.dart';

part 'user_social.g.dart';

@JsonSerializable()
class UserSocial {
  @JsonKey(name: "instagram_username")
  dynamic instagramUsername;

  @JsonKey(name: "portfolio_url")
  dynamic portfolioUrl;
  @JsonKey(name: "paypal_email")
  dynamic paypalEmail;

  @JsonKey(defaultValue: "", name: "twitter_username")
  String twitterUsername;

  UserSocial({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
    required this.paypalEmail,
  });

  factory UserSocial.fromJson(Map<String, dynamic> json) =>
      _$UserSocialFromJson(json);

  Map<String, dynamic> toJson() => _$UserSocialToJson(this);
}
