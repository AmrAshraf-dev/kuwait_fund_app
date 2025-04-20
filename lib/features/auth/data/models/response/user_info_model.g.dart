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
      if (instance.isError case final value?) 'isError': value,
      if (instance.errorMsg case final value?) 'errorMsg': value,
      if (instance.isValidUser case final value?) 'isValidUser': value,
      if (instance.isDirector case final value?) 'isDirector': value,
      if (instance.isSupervisor case final value?) 'isSupervisor': value,
      if (instance.isTrainingSupervisor case final value?)
        'isTrainingSupervisor': value,
      if (instance.name case final value?) 'name': value,
      if (instance.designation case final value?) 'designation': value,
      if (instance.phoneNumber case final value?) 'phoneNumber': value,
      if (instance.photoURL case final value?) 'photoURL': value,
    };
