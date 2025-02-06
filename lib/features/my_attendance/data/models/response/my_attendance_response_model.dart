import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/my_attendance/data/models/response/attendance_data_response_model.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/my_attendance_entity.dart';

part 'my_attendance_response_model.g.dart';

/// Model that transforms the MyAttendance data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class MyAttendanceModel extends MyAttendanceEntity {
  const MyAttendanceModel({
    required super.availableHours,
    required super.usedHours,
    required super.delayHours,
    required super.attendanceData,
  });

  factory MyAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$MyAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyAttendanceModelToJson(this);
}

@JsonSerializable()
class MyAttendanceResponseModel extends BaseEntity<MyAttendanceModel> {
  const MyAttendanceResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory MyAttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MyAttendanceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyAttendanceResponseModelToJson(this);
}
