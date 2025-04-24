// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_child_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditChildRequestModel _$EditChildRequestModelFromJson(
        Map<String, dynamic> json) =>
    EditChildRequestModel(
      childId: (json['childId'] as num?)?.toInt(),
      childArabicName: json['childArabicName'] as String?,
      childEnglishName: json['childEnglishName'] as String?,
      childCivilId: json['childCivilId'] as String?,
      childBirthDate: json['childBirthDate'] as String?,
      childGender: json['childGender'] as String?,
      childDisabilityDate: json['childDisabilityDate'] as String?,
      childDisabilityType: json['childDisabilityType'] as String?,
      fileExtention: json['fileExtention'] as String?,
      bytes: json['bytes'] as String?,
    );

Map<String, dynamic> _$EditChildRequestModelToJson(
        EditChildRequestModel instance) =>
    <String, dynamic>{
      if (instance.childId case final value?) 'childId': value,
      if (instance.childArabicName case final value?) 'childArabicName': value,
      if (instance.childEnglishName case final value?)
        'childEnglishName': value,
      if (instance.childCivilId case final value?) 'childCivilId': value,
      if (instance.childBirthDate case final value?) 'childBirthDate': value,
      if (instance.childGender case final value?) 'childGender': value,
      if (instance.childDisabilityDate case final value?)
        'childDisabilityDate': value,
      if (instance.childDisabilityType case final value?)
        'childDisabilityType': value,
      if (instance.fileExtention case final value?) 'fileExtention': value,
      if (instance.bytes case final value?) 'bytes': value,
    };
