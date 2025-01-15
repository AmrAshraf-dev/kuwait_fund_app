// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceModel _$InsuranceModelFromJson(Map<String, dynamic> json) =>
    InsuranceModel(
      id: json['id'] as String?,
      programName: json['programName'] as String?,
      employeeName: json['employeeName'] as String?,
      insuranceCompanyName: json['insuranceCompanyName'] as String?,
      insuranceCompany: json['insuranceCompany'] as String?,
      statusLabel: json['statusLabel'] as String?,
      noOfPersons: json['noOfPersons'] as String?,
      startDate: json['startDate'] as String?,
      deleteNotes: json['deleteNotes'] as String?,
      programSubscribed: json['programSubscribed'] as String?,
      viewButtons: json['viewButtons'] as String?,
      beneficiaries: json['beneficiaries'] as String?,
    );

Map<String, dynamic> _$InsuranceModelToJson(InsuranceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'programName': instance.programName,
      'employeeName': instance.employeeName,
      'insuranceCompanyName': instance.insuranceCompanyName,
      'insuranceCompany': instance.insuranceCompany,
      'statusLabel': instance.statusLabel,
      'noOfPersons': instance.noOfPersons,
      'startDate': instance.startDate,
      'deleteNotes': instance.deleteNotes,
      'programSubscribed': instance.programSubscribed,
      'viewButtons': instance.viewButtons,
      'beneficiaries': instance.beneficiaries,
    };

InsuranceResponseModel _$InsuranceResponseModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InsuranceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
