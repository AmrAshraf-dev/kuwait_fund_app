// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoModel _$PersonalInfoModelFromJson(Map<String, dynamic> json) =>
    PersonalInfoModel(
      employeeNumber: json['employeeNumber'] as String?,
      name: json['name'] as String?,
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

Map<String, dynamic> _$PersonalInfoModelToJson(PersonalInfoModel instance) =>
    <String, dynamic>{
      if (instance.employeeNumber case final value?) 'employeeNumber': value,
      if (instance.name case final value?) 'name': value,
      if (instance.designationName case final value?) 'designationName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone1 case final value?) 'phone1': value,
      if (instance.phone2 case final value?) 'phone2': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.civilID case final value?) 'civilID': value,
      if (instance.recidancyExpiryDate case final value?)
        'recidancyExpiryDate': value,
      if (instance.nationalityName case final value?) 'nationalityName': value,
      if (instance.passportExpiryDate case final value?)
        'passportExpiryDate': value,
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
      attachmentInfo: json['attachmentInfo'] as String?,
      phone1: json['phone1'] as String?,
      phone2: json['phone2'] as String?,
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
      if (instance.phone1 case final value?) 'phone1': value,
      if (instance.phone2 case final value?) 'phone2': value,
      if (instance.attachmentInfo case final value?) 'attachmentInfo': value,
    };

PersonalInfoResponseModel _$PersonalInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    PersonalInfoResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PersonalInfoModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$PersonalInfoResponseModelToJson(
        PersonalInfoResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
