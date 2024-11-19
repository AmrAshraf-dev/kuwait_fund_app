import 'package:json_annotation/json_annotation.dart';

part 'admin_home_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class AdminHomeRequestModel {
  AdminHomeRequestModel({required this.email, required this.lang});

  factory AdminHomeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AdminHomeRequestModelFromJson(json);
  final String? email;
  final String? lang;

  Map<String, dynamic> toJson() => _$AdminHomeRequestModelToJson(this);
}
