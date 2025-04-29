// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      passportNumber: json['passportNumber'] as String?,
      employeeNumber: json['employeeNumber'] as String?,
      nameArabic: json['nameArabic'] as String?,
      nameEnglish: json['nameEnglish'] as String?,
      designationName: json['designationName'] as String?,
      email: json['email'] as String?,
      phone1: json['phone1'] as String?,
      phone2: json['phone2'] as String?,
      civilID: json['civilID'] as String?,
      recidancyExpiryDate: json['recidancyExpiryDate'] as String?,
      nationalityName: json['nationalityName'] as String?,
      passportExpiryDate: json['passportExpiryDate'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      if (instance.employeeNumber case final value?) 'employeeNumber': value,
      if (instance.nameEnglish case final value?) 'nameEnglish': value,
      if (instance.nameArabic case final value?) 'nameArabic': value,
      if (instance.designationName case final value?) 'designationName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.civilID case final value?) 'civilID': value,
      if (instance.recidancyExpiryDate case final value?)
        'recidancyExpiryDate': value,
      if (instance.nationalityName case final value?) 'nationalityName': value,
      if (instance.passportExpiryDate case final value?)
        'passportExpiryDate': value,
      if (instance.passportNumber case final value?) 'passportNumber': value,
      if (instance.phone1 case final value?) 'phone1': value,
      if (instance.phone2 case final value?) 'phone2': value,
    };

EmployeeAddressModel _$EmployeeAddressModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeAddressModel(
      apartmentNumber: json['apartmentNumber'] as String?,
      building: json['building'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      block: json['block'] as String?,
      avenue: json['avenue'] as String?,
    );

Map<String, dynamic> _$EmployeeAddressModelToJson(
        EmployeeAddressModel instance) =>
    <String, dynamic>{
      if (instance.city case final value?) 'city': value,
      if (instance.block case final value?) 'block': value,
      if (instance.street case final value?) 'street': value,
      if (instance.avenue case final value?) 'avenue': value,
      if (instance.building case final value?) 'building': value,
      if (instance.apartmentNumber case final value?) 'apartmentNumber': value,
    };
