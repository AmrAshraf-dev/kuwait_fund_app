// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_loan_master_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalLoanMasterInfoModel _$PersonalLoanMasterInfoModelFromJson(
        Map<String, dynamic> json) =>
    PersonalLoanMasterInfoModel(
      personalLoanRequestID: json['personalLoanRequestID'] as String?,
      employeeName: json['employeeName'] as String?,
      loanAmount: json['loanAmount'] as String?,
      noOfInstalments: json['noOfInstalments'] as String?,
      installmentAmount: json['installmentAmount'] as String?,
      applicationDate: json['applicationDate'] as String?,
      approvalType: json['approvalType'] as String?,
      remarks: json['remarks'] as String?,
      reasonLabel: json['reasonLabel'] as String?,
      maxLoanAmount: json['maxLoanAmount'] as String?,
    );

Map<String, dynamic> _$PersonalLoanMasterInfoModelToJson(
        PersonalLoanMasterInfoModel instance) =>
    <String, dynamic>{
      'personalLoanRequestID': instance.personalLoanRequestID,
      'employeeName': instance.employeeName,
      'loanAmount': instance.loanAmount,
      'noOfInstalments': instance.noOfInstalments,
      'installmentAmount': instance.installmentAmount,
      'applicationDate': instance.applicationDate,
      'approvalType': instance.approvalType,
      'remarks': instance.remarks,
      'reasonLabel': instance.reasonLabel,
      'maxLoanAmount': instance.maxLoanAmount,
    };

PersonalLoanMasterInfoResponseModel
    _$PersonalLoanMasterInfoResponseModelFromJson(Map<String, dynamic> json) =>
        PersonalLoanMasterInfoResponseModel(
          code: (json['code'] as num?)?.toInt(),
          data: json['data'] == null
              ? null
              : PersonalLoanMasterInfoModel.fromJson(
                  json['data'] as Map<String, dynamic>),
          message: json['message'] as String?,
          totalRecords: (json['totalRecords'] as num?)?.toInt(),
          hasMorePages: json['hasMorePages'] as bool?,
        );

Map<String, dynamic> _$PersonalLoanMasterInfoResponseModelToJson(
        PersonalLoanMasterInfoResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
