// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_attendance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAttendanceModel _$MyAttendanceModelFromJson(Map<String, dynamic> json) =>
    MyAttendanceModel(
      availableHours: json['availableHours'] as String?,
      usedHours: json['usedHours'] as String?,
      delayHours: json['delayHours'] as String?,
      attendanceData: (json['attendanceData'] as List<dynamic>)
          .map((e) => AttendanceDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyAttendanceModelToJson(MyAttendanceModel instance) =>
    <String, dynamic>{
      'availableHours': instance.availableHours,
      'usedHours': instance.usedHours,
      'delayHours': instance.delayHours,
      'attendanceData': instance.attendanceData,
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
