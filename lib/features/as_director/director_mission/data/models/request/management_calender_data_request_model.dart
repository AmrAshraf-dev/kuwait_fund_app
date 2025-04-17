import 'package:json_annotation/json_annotation.dart';

part 'management_calender_data_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class ManagementCalenderDataRequestModel {
  ManagementCalenderDataRequestModel({required this.month, required this.year , required this.empID});

  factory ManagementCalenderDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ManagementCalenderDataRequestModelFromJson(json);
  final int? month;
  final int? year;
  final int? empID;

  Map<String, dynamic> toJson() => _$ManagementCalenderDataRequestModelToJson(this);
}
