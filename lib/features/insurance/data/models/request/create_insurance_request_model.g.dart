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
      if (instance.familyMembers?.map((e) => e.toJson()).toList()
          case final value?)
        'familyMembers': value,
      if (instance.beneficiaries case final value?) 'beneficiaries': value,
      if (instance.programSubscribedId case final value?)
        'programSubscribedId': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.insuranceCompanyID case final value?)
        'insuranceCompanyID': value,
    };
