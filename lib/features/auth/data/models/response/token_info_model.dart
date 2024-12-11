import 'package:json_annotation/json_annotation.dart';

part 'token_info_model.g.dart';

@JsonSerializable()
class TokenInfoModel {
  final String token;
  final DateTime expireDate;

  TokenInfoModel({
    required this.token,
    required this.expireDate,
  });

  // Factory method to create an instance from a JSON map
  factory TokenInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoModelFromJson(json);

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() => _$TokenInfoModelToJson(this);
}
