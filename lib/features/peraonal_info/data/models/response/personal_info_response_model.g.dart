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
      contractTypeName: json['contractTypeName'] as String?,
      contactStartDate: json['contactStartDate'] as String?,
      contactEndDate: json['contactEndDate'] as String?,
      joiningDate: json['joiningDate'] as String?,
      attachmentInfo: json['attachmentInfo'] as String?,
    );

Map<String, dynamic> _$PersonalInfoModelToJson(PersonalInfoModel instance) =>
    <String, dynamic>{
      if (instance.employeeNumber case final value?) 'employeeNumber': value,
      if (instance.name case final value?) 'name': value,
      if (instance.designationName case final value?) 'designationName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone1 case final value?) 'phone1': value,
      if (instance.phone2 case final value?) 'phone2': value,
      if (instance.civilID case final value?) 'civilID': value,
      if (instance.recidancyExpiryDate case final value?)
        'recidancyExpiryDate': value,
      if (instance.nationalityName case final value?) 'nationalityName': value,
      if (instance.passportExpiryDate case final value?)
        'passportExpiryDate': value,
      if (instance.contractTypeName case final value?)
        'contractTypeName': value,
      if (instance.contactStartDate case final value?)
        'contactStartDate': value,
      if (instance.contactEndDate case final value?) 'contactEndDate': value,
      if (instance.joiningDate case final value?) 'joiningDate': value,
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
