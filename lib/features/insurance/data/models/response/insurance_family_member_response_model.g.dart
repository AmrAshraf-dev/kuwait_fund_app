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
      'id': instance.id,
      'name': instance.name,
      'englishName': instance.englishName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'relativeInd': instance.relativeInd,
      'isSubscribed': instance.isSubscribed,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
