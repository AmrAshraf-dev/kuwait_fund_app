import 'package:json_annotation/json_annotation.dart';

part 'dept_calendar_data_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class DeptCalenderDataRequestModel {
  DeptCalenderDataRequestModel({required this.deptCode, required this.month , required this.year});

  factory DeptCalenderDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DeptCalenderDataRequestModelFromJson(json);
  final int? year;
  final int? month;
  final String? deptCode;

  Map<String, dynamic> toJson() => _$DeptCalenderDataRequestModelToJson(this);
}
