import 'package:json_annotation/json_annotation.dart';

part 'token_info_model.g.dart';

@JsonSerializable()
class TokenInfoModel {
  final String token;
  final DateTime accessTokenExpiryTime;
  final String refreshToken;

  TokenInfoModel({
    required this.token,
    required this.accessTokenExpiryTime,
    required this.refreshToken,
  });

  // Factory method to create an instance from a JSON map
  factory TokenInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoModelFromJson(json);

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() => _$TokenInfoModelToJson(this);
}
