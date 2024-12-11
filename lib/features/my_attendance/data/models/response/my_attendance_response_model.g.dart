// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_attendance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAttendanceModel _$MyAttendanceModelFromJson(Map<String, dynamic> json) =>
    MyAttendanceModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$MyAttendanceModelToJson(MyAttendanceModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

MyAttendanceResponseModel _$MyAttendanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    MyAttendanceResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : MyAttendanceModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$MyAttendanceResponseModelToJson(
        MyAttendanceResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
