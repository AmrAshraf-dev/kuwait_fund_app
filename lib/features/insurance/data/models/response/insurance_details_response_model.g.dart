// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceDetailsModel _$InsuranceDetailsModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceDetailsModel(
      employeeName: json['employeeName'] as String?,
      insuranceCompanyID: json['insuranceCompanyID'] as String?,
      insurenceStatus: json['insurenceStatus'] as String?,
      insuranceCompanyName: json['insuranceCompanyName'] as String?,
      noOfPersons: json['noOfPersons'] as String?,
      startDate: json['startDate'] as String?,
      programSubscribed: json['programSubscribed'] as String?,
      isMedicallySubscribed: json['isMedicallySubscribed'] as bool?,
      hasMedicalRequest: json['hasMedicalRequest'] as bool?,
      viewCancelButton: json['viewCancelButton'] as bool?,
      isAllowedTosubscribe: json['isAllowedTosubscribe'] as bool?,
      beneficiaries: json['beneficiaries'] as String?,
    );

Map<String, dynamic> _$InsuranceDetailsModelToJson(
        InsuranceDetailsModel instance) =>
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

InsuranceDetailsResponseModel _$InsuranceDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceDetailsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : InsuranceDetailsModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$InsuranceDetailsResponseModelToJson(
        InsuranceDetailsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
