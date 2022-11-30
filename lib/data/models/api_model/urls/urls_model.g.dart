// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urls_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlsModel _$UrlsModelFromJson(Map<String, dynamic> json) => UrlsModel(
      raw: json['raw'] as String? ?? '',
      full: json['full'] as String? ?? '',
      small: json['small'] as String? ?? '',
      smalls3: json['small_s3'] as String? ?? '',
      regular: json['regular'] as String? ?? '',
      thumb: json['thumb'] as String? ?? '',
    );

Map<String, dynamic> _$UrlsModelToJson(UrlsModel instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
      'small_s3': instance.smalls3,
    };
