import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final bool? isError;
  final String? errorMsg;
  final bool? isValidUser;
  final bool? isDirector;
  final bool? isSupervisor;
  final bool? isTrainingSupervisor;
  final String? name;
  final String? designation;
  final String? phoneNumber;
  final String? photoURL;

  UserInfoModel({
    required this.isError,
    required this.errorMsg,
    required this.isValidUser,
    required this.isDirector,
    required this.isSupervisor,
    required this.isTrainingSupervisor,
    required this.name,
    required this.designation,
    required this.phoneNumber,
    required this.photoURL,
  });

  // Factory method to create an instance from a JSON map
  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
