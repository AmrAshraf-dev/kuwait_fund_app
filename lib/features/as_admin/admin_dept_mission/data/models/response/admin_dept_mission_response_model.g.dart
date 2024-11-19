// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dept_mission_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDeptMissionModel _$AdminDeptMissionModelFromJson(
        Map<String, dynamic> json) =>
    AdminDeptMissionModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$AdminDeptMissionModelToJson(
        AdminDeptMissionModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

AdminDeptMissionResponseModel _$AdminDeptMissionResponseModelFromJson(
        Map<String, dynamic> json) =>
    AdminDeptMissionResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AdminDeptMissionModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AdminDeptMissionResponseModelToJson(
        AdminDeptMissionResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
