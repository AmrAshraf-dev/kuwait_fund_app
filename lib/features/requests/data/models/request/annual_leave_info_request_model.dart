import 'package:json_annotation/json_annotation.dart';

part 'annual_leave_info_request_model.g.dart';
/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class AnnualLeaveInfoRequestModel {
  AnnualLeaveInfoRequestModel({
    this.leaveRequestID,
  });

  factory AnnualLeaveInfoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualLeaveInfoRequestModelFromJson(json);
  final String? leaveRequestID;

  Map<String, dynamic> toJson() => _$AnnualLeaveInfoRequestModelToJson(this);
}
