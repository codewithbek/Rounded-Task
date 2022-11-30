import 'package:json_annotation/json_annotation.dart';

part 'profile_image.g.dart';

@JsonSerializable()
class ProfileImage {
  @JsonKey(defaultValue: "", name: "small")
  String small;

  @JsonKey(defaultValue: "", name: "medium")
  String medium;

  @JsonKey(defaultValue: "", name: "large")
  String large;


  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
   
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
