import 'package:json_annotation/json_annotation.dart';

part 'director_mission_details_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class DirectorMissionDetailsRequestModel {
  DirectorMissionDetailsRequestModel({required this.asDate,   required this.empID});

  factory DirectorMissionDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorMissionDetailsRequestModelFromJson(json);
  final String? asDate;
   final int? empID;

  Map<String, dynamic> toJson() => _$DirectorMissionDetailsRequestModelToJson(this);
}
