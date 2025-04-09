import 'package:json_annotation/json_annotation.dart';

part 'visitors_logs_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class VisitorsLogsRequestModel {
  VisitorsLogsRequestModel({required this.month, required this.year});

  factory VisitorsLogsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsRequestModelFromJson(json);
  final String? month;
  final String? year;

  Map<String, dynamic> toJson() => _$VisitorsLogsRequestModelToJson(this);
}
