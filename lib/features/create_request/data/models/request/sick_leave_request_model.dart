import 'package:json_annotation/json_annotation.dart';

part 'sick_leave_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class SickLeaveRequestModel {
  SickLeaveRequestModel({required this.fileExtention, required this.bytes});

  factory SickLeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SickLeaveRequestModelFromJson(json);
  final String? fileExtention;
  final String? bytes;

  Map<String, dynamic> toJson() => _$SickLeaveRequestModelToJson(this);
}
