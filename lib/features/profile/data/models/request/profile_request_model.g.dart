// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRequestModel _$ProfileRequestModelFromJson(Map<String, dynamic> json) =>
    ProfileRequestModel(
      nameArabic: json['nameArabic'] as String?,
      nameEnglish: json['nameEnglish'] as String?,
      mobile: json['mobile'] as String?,
      recidancyExpiryDate: json['recidancyExpiryDate'] as String?,
      passportExpiryDate: json['passportExpiryDate'] as String?,
    );

Map<String, dynamic> _$ProfileRequestModelToJson(
        ProfileRequestModel instance) =>
    <String, dynamic>{
      if (instance.nameArabic case final value?) 'nameArabic': value,
      if (instance.nameEnglish case final value?) 'nameEnglish': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.recidancyExpiryDate case final value?)
        'recidancyExpiryDate': value,
      if (instance.passportExpiryDate case final value?)
        'passportExpiryDate': value,
    };
