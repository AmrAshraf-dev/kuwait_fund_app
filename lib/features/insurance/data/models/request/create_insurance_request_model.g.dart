// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_insurance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInsuranceRequestModel _$CreateInsuranceRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateInsuranceRequestModel(
      familyMembers: (json['familyMembers'] as List<dynamic>?)
          ?.map((e) =>
              InsuranceFamilyMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      beneficiaries: json['beneficiaries'] as String?,
      programSubscribedId: json['programSubscribedId'] as String?,
      startDate: json['startDate'] as String?,
      insuranceCompanyID: json['insuranceCompanyID'] as String?,
    );

Map<String, dynamic> _$CreateInsuranceRequestModelToJson(
        CreateInsuranceRequestModel instance) =>
    <String, dynamic>{
      'familyMembers': instance.familyMembers,
      'beneficiaries': instance.beneficiaries,
      'programSubscribedId': instance.programSubscribedId,
      'startDate': instance.startDate,
      'insuranceCompanyID': instance.insuranceCompanyID,
    };
