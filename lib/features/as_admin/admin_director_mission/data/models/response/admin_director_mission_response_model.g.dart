// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_director_mission_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDirectorMissionModel _$AdminDirectorMissionModelFromJson(
        Map<String, dynamic> json) =>
    AdminDirectorMissionModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$AdminDirectorMissionModelToJson(
        AdminDirectorMissionModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

AdminDirectorMissionResponseModel _$AdminDirectorMissionResponseModelFromJson(
        Map<String, dynamic> json) =>
    AdminDirectorMissionResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AdminDirectorMissionModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AdminDirectorMissionResponseModelToJson(
        AdminDirectorMissionResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
