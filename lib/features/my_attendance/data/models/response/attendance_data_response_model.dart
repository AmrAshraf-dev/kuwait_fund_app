import 'package:json_annotation/json_annotation.dart';
import 'in_out_time_response_model.dart';
import '../../../domain/entities/my_attendance_entity.dart';

part 'attendance_data_response_model.g.dart';

@JsonSerializable()
class AttendanceDataModel extends AttendanceDataEntity {
  const AttendanceDataModel({
    required super.attendanceDate,
    required super.inOutInfo,
  });

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDataModelToJson(this);
}
