// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
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

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
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

ProfileResponseModel _$ProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ProfileModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
