// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsModel _$AdsModelFromJson(Map<String, dynamic> json) => AdsModel(
      id: (json['id'] as num?)?.toInt(),
      templateImageUrl: json['templateImageUrl'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdOn: json['createdOn'] as String?,
      expiresOn: json['expiresOn'] as String?,
      externalImage: json['externalImage'] as String?,
      moreLink: json['moreLink'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AdsModelToJson(AdsModel instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.sortOrder case final value?) 'sortOrder': value,
      if (instance.title case final value?) 'title': value,
      if (instance.body case final value?) 'body': value,
      if (instance.moreLink case final value?) 'moreLink': value,
      if (instance.externalImage case final value?) 'externalImage': value,
      if (instance.templateImageUrl case final value?)
        'templateImageUrl': value,
      if (instance.expiresOn case final value?) 'expiresOn': value,
      if (instance.createdOn case final value?) 'createdOn': value,
    };

AdsResponseModel _$AdsResponseModelFromJson(Map<String, dynamic> json) =>
    AdsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AdsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AdsResponseModelToJson(AdsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
