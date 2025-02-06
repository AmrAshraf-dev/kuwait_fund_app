// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceDataModel _$AttendanceDataModelFromJson(Map<String, dynamic> json) =>
    AttendanceDataModel(
      attendanceDate: json['attendanceDate'] as String?,
      inOutInfo: (json['inOutInfo'] as List<dynamic>)
          .map((e) => InOutTimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceDataModelToJson(
        AttendanceDataModel instance) =>
    <String, dynamic>{
      'attendanceDate': instance.attendanceDate,
      'inOutInfo': instance.inOutInfo,
    };
