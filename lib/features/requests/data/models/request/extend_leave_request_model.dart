import 'package:json_annotation/json_annotation.dart';

part 'extend_leave_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class ExtendLeaveRequestModel {
  ExtendLeaveRequestModel(
      {required this.leaveRequestId, required this.extendDate});

  factory ExtendLeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ExtendLeaveRequestModelFromJson(json);
  final String? leaveRequestId;
  final String? extendDate;

  Map<String, dynamic> toJson() => _$ExtendLeaveRequestModelToJson(this);
}
