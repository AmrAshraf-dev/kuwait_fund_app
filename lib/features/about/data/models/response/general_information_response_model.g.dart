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
      'title': instance.title,
      'description': instance.description,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
