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
      'employeeNumber': instance.employeeNumber,
      'name': instance.name,
      'designationName': instance.designationName,
      'email': instance.email,
      'phone1': instance.phone1,
      'phone2': instance.phone2,
      'civilID': instance.civilID,
      'recidancyExpiryDate': instance.recidancyExpiryDate,
      'nationalityName': instance.nationalityName,
      'passportExpiryDate': instance.passportExpiryDate,
      'contractTypeName': instance.contractTypeName,
      'contactStartDate': instance.contactStartDate,
      'contactEndDate': instance.contactEndDate,
      'joiningDate': instance.joiningDate,
      'attachmentInfo': instance.attachmentInfo,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
