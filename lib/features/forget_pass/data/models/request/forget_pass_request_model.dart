import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class ForgetPassRequestModel {
  ForgetPassRequestModel({required this.userName, this.otp, this.password});

  factory ForgetPassRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassRequestModelFromJson(json);
  final String? userName;
  final String? otp;
  final String? password;

  Map<String, dynamic> toJson() => _$ForgetPassRequestModelToJson(this);
}
