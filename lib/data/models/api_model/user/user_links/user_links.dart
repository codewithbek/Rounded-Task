import 'package:json_annotation/json_annotation.dart';

part 'user_links.g.dart';

@JsonSerializable()
class UserLinks {
  @JsonKey(defaultValue: "", name: "self")
  String self;

  @JsonKey(defaultValue: "", name: "html")
  String html;

  @JsonKey(defaultValue: "", name: "photos")
  String photos;

  @JsonKey(defaultValue: "", name: "likes")
  String likes;

  @JsonKey(defaultValue: "", name: "portfolio")
  String portfolio;

  @JsonKey(defaultValue: "", name: "following")
  String following;
  @JsonKey(defaultValue: "", name: "followers")
  String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.followers,
    required this.following,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) =>
      _$UserLinksFromJson(json);

  Map<String, dynamic> toJson() => _$UserLinksToJson(this);
}
