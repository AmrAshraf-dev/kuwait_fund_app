import 'package:json_annotation/json_annotation.dart';

part 'reject_leave_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class RejectLeaveRequestModel {
  RejectLeaveRequestModel({
    this.leaveRequestID,
    this.rejectReson,
  });

  factory RejectLeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RejectLeaveRequestModelFromJson(json);

  final String? leaveRequestID;
  final String? rejectReson;

  Map<String, dynamic> toJson() => _$RejectLeaveRequestModelToJson(this);
}
