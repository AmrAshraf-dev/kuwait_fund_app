import 'package:json_annotation/json_annotation.dart';

part 'delete_leave_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class DeleteLeaveRequestModel {
  DeleteLeaveRequestModel({required this.leaveRequestID});

  factory DeleteLeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteLeaveRequestModelFromJson(json);
  final int? leaveRequestID;

  Map<String, dynamic> toJson() => _$DeleteLeaveRequestModelToJson(this);
}
