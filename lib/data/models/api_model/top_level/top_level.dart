import 'package:json_annotation/json_annotation.dart';
import 'package:untitled2/data/models/api_model/urls/urls_model.dart';
import 'package:untitled2/data/models/api_model/user/user_links/user_links.dart';
import 'package:untitled2/data/models/api_model/user/user_model.dart';

part 'top_level.g.dart';

@JsonSerializable()
class TopLevelModel {
  @JsonKey(defaultValue: "", name: "id")
  String id;

  @JsonKey(defaultValue: "", name: "updated_at")
  String updatedAt;

  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  @JsonKey(defaultValue: "", name: "promoted_at")
  String promotedAt;

  @JsonKey(defaultValue: 0, name: "width")
  int width;

  @JsonKey(defaultValue: 0, name: "height")
  int height;

  @JsonKey(defaultValue: "", name: "color")
  String color;

  @JsonKey(defaultValue: "", name: "blur_hash")
  String blurHash;

  @JsonKey(name: "urls")
  UrlsModel urlsModel;

  @JsonKey(name: "user")
  UserModel userModel;

  @JsonKey(name: "links")
  UserLinks links;

  @JsonKey(defaultValue: 0, name: "likes")
  int likes;

  @JsonKey(defaultValue: 0, name: "total_likes")
  int totalLikes;

  @JsonKey(defaultValue: 0, name: "views")
  int views;
  @JsonKey(defaultValue: 0, name: "downloads")
  int downloads;

  @JsonKey(defaultValue: false, name: "public_domain")
  bool publicDomain;

  @JsonKey(defaultValue: false, name: "liked_by_user")
  bool likedByUser;

  TopLevelModel({
    required this.blurHash,
    required this.id,
    required this.color,
    required this.createdAt,
    required this.downloads,
    required this.height,
    required this.width,
    required this.likedByUser,
    required this.likes,
    required this.links,
    required this.promotedAt,
    required this.publicDomain,
    required this.totalLikes,
    required this.updatedAt,
    required this.urlsModel,
    required this.userModel,
    required this.views,
  });

  factory TopLevelModel.fromJson(Map<String, dynamic> json) =>
      _$TopLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopLevelModelToJson(this);
}
