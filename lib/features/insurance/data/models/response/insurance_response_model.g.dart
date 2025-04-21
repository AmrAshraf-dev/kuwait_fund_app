// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceModel _$InsuranceModelFromJson(Map<String, dynamic> json) =>
    InsuranceModel(
      employeeName: json['employeeName'] as String?,
      insuranceCompanyName: json['insuranceCompanyName'] as String?,
      noOfPersons: json['noOfPersons'] as String?,
      startDate: json['startDate'] as String?,
      programSubscribed: json['programSubscribed'] as String?,
      beneficiaries: json['beneficiaries'] as String?,
      insuranceCompanyID: json['insuranceCompanyID'] as String?,
      insurenceStatus: json['insurenceStatus'] as String?,
      isMedicallySubscribed: json['isMedicallySubscribed'] as bool?,
      hasMedicalRequest: json['hasMedicalRequest'] as bool?,
      viewCancelButton: json['viewCancelButton'] as bool?,
      isAllowedTosubscribe: json['isAllowedTosubscribe'] as bool?,
    );

Map<String, dynamic> _$InsuranceModelToJson(InsuranceModel instance) =>
    <String, dynamic>{
      if (instance.insuranceCompanyID case final value?)
        'insuranceCompanyID': value,
      if (instance.insurenceStatus case final value?) 'insurenceStatus': value,
      if (instance.isMedicallySubscribed case final value?)
        'isMedicallySubscribed': value,
      if (instance.hasMedicalRequest case final value?)
        'hasMedicalRequest': value,
      if (instance.viewCancelButton case final value?)
        'viewCancelButton': value,
      if (instance.isAllowedTosubscribe case final value?)
        'isAllowedTosubscribe': value,
      if (instance.employeeName case final value?) 'employeeName': value,
      if (instance.insuranceCompanyName case final value?)
        'insuranceCompanyName': value,
      if (instance.noOfPersons case final value?) 'noOfPersons': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.programSubscribed case final value?)
        'programSubscribed': value,
      if (instance.beneficiaries case final value?) 'beneficiaries': value,
    };

InsuranceResponseModel _$InsuranceResponseModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : InsuranceModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$InsuranceResponseModelToJson(
        InsuranceResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
