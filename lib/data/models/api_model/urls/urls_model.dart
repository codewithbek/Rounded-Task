import 'package:json_annotation/json_annotation.dart';

part 'urls_model.g.dart';

@JsonSerializable()
class UrlsModel {
  @JsonKey(defaultValue: "", name: "raw")
  String raw;

  @JsonKey(defaultValue: "", name: "full")
  String full;

  @JsonKey(defaultValue: "", name: "regular")
  String regular;

  @JsonKey(defaultValue: "", name: "small")
  String small;

  @JsonKey(defaultValue: "", name: "thumb")
  String thumb;

  @JsonKey(defaultValue: "", name: "small_s3")
  String smalls3;

  UrlsModel({
    required this.raw,
    required this.full,
    required this.small,
    required this.smalls3,
    required this.regular,
    required this.thumb,
  });

  factory UrlsModel.fromJson(Map<String, dynamic> json) =>
      _$UrlsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsModelToJson(this);
}
