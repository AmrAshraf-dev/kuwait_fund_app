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
      'insuranceCompanyID': instance.insuranceCompanyID,
      'insurenceStatus': instance.insurenceStatus,
      'isMedicallySubscribed': instance.isMedicallySubscribed,
      'hasMedicalRequest': instance.hasMedicalRequest,
      'viewCancelButton': instance.viewCancelButton,
      'isAllowedTosubscribe': instance.isAllowedTosubscribe,
      'employeeName': instance.employeeName,
      'insuranceCompanyName': instance.insuranceCompanyName,
      'noOfPersons': instance.noOfPersons,
      'startDate': instance.startDate,
      'programSubscribed': instance.programSubscribed,
      'beneficiaries': instance.beneficiaries,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
