// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_family_member_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceFamilyMemberModel _$InsuranceFamilyMemberModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceFamilyMemberModel(
      dateOfBirth: json['dateOfBirth'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      relativeInd: json['relativeInd'] as String?,
      englishName: json['englishName'] as String?,
      gender: json['gender'] as String?,
      isSubscribed: json['isSubscribed'] as bool?,
    );

Map<String, dynamic> _$InsuranceFamilyMemberModelToJson(
        InsuranceFamilyMemberModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.englishName case final value?) 'englishName': value,
      if (instance.dateOfBirth case final value?) 'dateOfBirth': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.relativeInd case final value?) 'relativeInd': value,
      if (instance.isSubscribed case final value?) 'isSubscribed': value,
    };

InsuranceFamilyMemberResponseModel _$InsuranceFamilyMemberResponseModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceFamilyMemberResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              InsuranceFamilyMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$InsuranceFamilyMemberResponseModelToJson(
        InsuranceFamilyMemberResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
