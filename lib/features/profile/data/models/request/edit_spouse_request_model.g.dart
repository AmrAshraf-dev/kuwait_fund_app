// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_spouse_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditSpouseRequestModel _$EditSpouseRequestModelFromJson(
        Map<String, dynamic> json) =>
    EditSpouseRequestModel(
      spouseId: (json['spouseId'] as num?)?.toInt(),
      spouseArabicName: json['spouseArabicName'] as String?,
      spouseEnglishName: json['spouseEnglishName'] as String?,
      spouseCivilID: json['spouseCivilID'] as String?,
      spouserBirthDate: json['spouserBirthDate'] as String?,
      spouseStatus: json['spouseStatus'] as String?,
      spouseStatusDate: json['spouseStatusDate'] as String?,
      fileExtention: json['fileExtention'] as String?,
      bytes: json['bytes'] as String?,
    );

Map<String, dynamic> _$EditSpouseRequestModelToJson(
        EditSpouseRequestModel instance) =>
    <String, dynamic>{
      if (instance.spouseId case final value?) 'spouseId': value,
      if (instance.spouseArabicName case final value?)
        'spouseArabicName': value,
      if (instance.spouseEnglishName case final value?)
        'spouseEnglishName': value,
      if (instance.spouseCivilID case final value?) 'spouseCivilID': value,
      if (instance.spouserBirthDate case final value?)
        'spouserBirthDate': value,
      if (instance.spouseStatus case final value?) 'spouseStatus': value,
      if (instance.spouseStatusDate case final value?)
        'spouseStatusDate': value,
      if (instance.fileExtention case final value?) 'fileExtention': value,
      if (instance.bytes case final value?) 'bytes': value,
    };
