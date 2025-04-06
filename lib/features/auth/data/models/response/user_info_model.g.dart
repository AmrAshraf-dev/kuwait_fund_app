// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      isError: json['isError'] as bool?,
      errorMsg: json['errorMsg'] as String?,
      isValidUser: json['isValidUser'] as bool?,
      isDirector: json['isDirector'] as bool?,
      isSupervisor: json['isSupervisor'] as bool?,
      isTrainingSupervisor: json['isTrainingSupervisor'] as bool?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'isError': instance.isError,
      'errorMsg': instance.errorMsg,
      'isValidUser': instance.isValidUser,
      'isDirector': instance.isDirector,
      'isSupervisor': instance.isSupervisor,
      'isTrainingSupervisor': instance.isTrainingSupervisor,
      'name': instance.name,
      'designation': instance.designation,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoURL,
    };
