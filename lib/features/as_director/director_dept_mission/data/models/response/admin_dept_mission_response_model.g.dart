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
      if (instance.var1 case final value?) 'var1': value,
      if (instance.var2 case final value?) 'var2': value,
    };

AdminDeptMissionResponseModel _$AdminDeptMissionResponseModelFromJson(
        Map<String, dynamic> json) =>
    AdminDeptMissionResponseModel(
      code: (json['code'] as num?)?.toInt(),
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
