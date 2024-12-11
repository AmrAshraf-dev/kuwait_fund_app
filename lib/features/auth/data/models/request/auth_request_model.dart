import 'package:json_annotation/json_annotation.dart';

part 'auth_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class AuthRequestModel {
  AuthRequestModel({required this.userName, required this.password});

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestModelFromJson(json);
  final String? userName;
  final String? password;

  Map<String, dynamic> toJson() => _$AuthRequestModelToJson(this);
}
