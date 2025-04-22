// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiences_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperiencesModel _$ExperiencesModelFromJson(Map<String, dynamic> json) =>
    ExperiencesModel(
      id: json['id'] as String?,
      employerName: json['employerName'] as String?,
      jobTitle: json['jobTitle'] as String?,
      joinDate: json['joinDate'] as String?,
      resignDate: json['resignDate'] as String?,
    );

Map<String, dynamic> _$ExperiencesModelToJson(ExperiencesModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.employerName case final value?) 'employerName': value,
      if (instance.jobTitle case final value?) 'jobTitle': value,
      if (instance.joinDate case final value?) 'joinDate': value,
      if (instance.resignDate case final value?) 'resignDate': value,
    };

ExperiencesResponseModel _$ExperiencesResponseModelFromJson(
        Map<String, dynamic> json) =>
    ExperiencesResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ExperiencesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ExperiencesResponseModelToJson(
        ExperiencesResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
