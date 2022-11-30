import 'package:json_annotation/json_annotation.dart';

import 'profile_image/profile_image.dart';
import 'social/user_social.dart';
import 'user_links/user_links.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(defaultValue: "", name: "id")
  String id;

  @JsonKey(defaultValue: "", name: "updated_at")
  String updatedAt;

  @JsonKey(defaultValue: "", name: "username")
  String username;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "first_name")
  String firstName;

  @JsonKey(defaultValue: "", name: "last_name")
  String lastName;

  @JsonKey(defaultValue: "", name: "twitter_username")
  String twitterUsername;

  @JsonKey(defaultValue: "", name: "portfolio_url")
  String portfolioUrl;

  @JsonKey(defaultValue: "", name: "bio")
  String bio;

  @JsonKey(defaultValue: "", name: "location")
  String location;

  @JsonKey(name: "links")
  UserLinks links;

  @JsonKey(name: "profile_image")
  ProfileImage profileImage;

  @JsonKey(name: "social")
  UserSocial social;

  @JsonKey(defaultValue: 0, name: "total_collections")
  int totalCollections;

  @JsonKey(defaultValue: 0, name: "total_likes")
  int totalLikes;

  @JsonKey(defaultValue: 0, name: "total_photos")
  int totalPhotos;

  @JsonKey(defaultValue: false, name: "accepted_tos")
  bool acceptedTos;

  @JsonKey(defaultValue: false, name: "for_hire")
  bool forHire;

  UserModel({
    required this.id,
    required this.acceptedTos,
    required this.bio,
    required this.firstName,
    required this.forHire,
    required this.lastName,
    required this.links,
    required this.location,
    required this.name,
    required this.portfolioUrl,
    required this.profileImage,
    required this.social,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.twitterUsername,
    required this.updatedAt,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
