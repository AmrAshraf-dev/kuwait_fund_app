import 'package:json_annotation/json_annotation.dart';

part 'annual_leave_details_request.model.g.dart';
/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class AnnualLeaveDetailsRequestModel {
  AnnualLeaveDetailsRequestModel({
    this.startDate,
    this.endDate,
  });

  factory AnnualLeaveDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualLeaveDetailsRequestModelFromJson(json);
  final String? startDate;
  final String? endDate;
  Map<String, dynamic> toJson() => _$AnnualLeaveDetailsRequestModelToJson(this);
}
