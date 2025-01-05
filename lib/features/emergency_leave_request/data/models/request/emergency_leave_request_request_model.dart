import 'package:json_annotation/json_annotation.dart';

part 'emergency_leave_request_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class EmergencyLeaveRequestRequestModel {
  EmergencyLeaveRequestRequestModel({
    this.leaveType,
    this.startDate,
    this.endDate,
    this.exitDate,
    this.requestedDays,
  });

  factory EmergencyLeaveRequestRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$EmergencyLeaveRequestRequestModelFromJson(json);
  final int? leaveType;
  final String? startDate;
  final String? endDate;
  final String? exitDate;
  final int? requestedDays;
  Map<String, dynamic> toJson() =>
      _$EmergencyLeaveRequestRequestModelToJson(this);
}
