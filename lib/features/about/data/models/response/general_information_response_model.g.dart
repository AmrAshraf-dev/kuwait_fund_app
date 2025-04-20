// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_information_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralInformationModel _$GeneralInformationModelFromJson(
        Map<String, dynamic> json) =>
    GeneralInformationModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GeneralInformationModelToJson(
        GeneralInformationModel instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.description case final value?) 'description': value,
    };

GeneralInformationResponseModel _$GeneralInformationResponseModelFromJson(
        Map<String, dynamic> json) =>
    GeneralInformationResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GeneralInformationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$GeneralInformationResponseModelToJson(
        GeneralInformationResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
