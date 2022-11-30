import 'package:json_annotation/json_annotation.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel {
  @JsonKey(defaultValue: "", name: "self")
  String self;

  @JsonKey(defaultValue: "", name: "html")
  String html;

  @JsonKey(defaultValue: "", name: "download")
  String download;

  @JsonKey(defaultValue: "", name: "download_location")
  String downloadLocation;

  LinksModel({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}
