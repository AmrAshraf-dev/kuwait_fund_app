// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qualifications_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QualificationsModel _$QualificationsModelFromJson(Map<String, dynamic> json) =>
    QualificationsModel(
      id: json['id'] as String?,
      educationName: json['educationName'] as String?,
      graduationDate: json['graduationDate'] as String?,
    );

Map<String, dynamic> _$QualificationsModelToJson(
        QualificationsModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.educationName case final value?) 'educationName': value,
      if (instance.graduationDate case final value?) 'graduationDate': value,
    };

QualificationsResponseModel _$QualificationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    QualificationsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QualificationsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$QualificationsResponseModelToJson(
        QualificationsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
