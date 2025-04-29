// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainProfileModel _$MainProfileModelFromJson(Map<String, dynamic> json) =>
    MainProfileModel(
      profile: json['profile'] == null
          ? null
          : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      employeeAddress: json['employeeAddress'] == null
          ? null
          : EmployeeAddressModel.fromJson(
              json['employeeAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainProfileModelToJson(MainProfileModel instance) =>
    <String, dynamic>{
      if (instance.profile?.toJson() case final value?) 'profile': value,
      if (instance.employeeAddress?.toJson() case final value?)
        'employeeAddress': value,
    };

MainProfileResponseModel _$MainProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    MainProfileResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : MainProfileModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$MainProfileResponseModelToJson(
        MainProfileResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
