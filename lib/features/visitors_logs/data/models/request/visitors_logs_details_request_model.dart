import 'package:json_annotation/json_annotation.dart';

part 'visitors_logs_details_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class VisitorsLogsDetailsRequestModel {
  VisitorsLogsDetailsRequestModel({  this.hostName, required this.date});

  factory VisitorsLogsDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsDetailsRequestModelFromJson(json);
  final String? hostName;
  final String? date;

  Map<String, dynamic> toJson() => _$VisitorsLogsDetailsRequestModelToJson(this);
}
