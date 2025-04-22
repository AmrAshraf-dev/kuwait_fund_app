// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dept_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeptModel _$DeptModelFromJson(Map<String, dynamic> json) => DeptModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      departmentCode: json['departmentCode'] as String?,
      director_name: json['director_name'] as String?,
    );

Map<String, dynamic> _$DeptModelToJson(DeptModel instance) => <String, dynamic>{
      if (instance.departmentCode case final value?) 'departmentCode': value,
      if (instance.name case final value?) 'name': value,
      if (instance.id case final value?) 'id': value,
      if (instance.director_name case final value?) 'director_name': value,
    };

DeptResponseModel _$DeptResponseModelFromJson(Map<String, dynamic> json) =>
    DeptResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DeptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$DeptResponseModelToJson(DeptResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
