// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kf_managment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KFManagmentModel _$KFManagmentModelFromJson(Map<String, dynamic> json) =>
    KFManagmentModel(
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$KFManagmentModelToJson(KFManagmentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'imageUrl': instance.imageUrl,
    };

KFManagmentResponseModel _$KFManagmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    KFManagmentResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => KFManagmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$KFManagmentResponseModelToJson(
        KFManagmentResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
