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
      if (instance.personalLoanRequestID case final value?)
        'personalLoanRequestID': value,
      if (instance.employeeName case final value?) 'employeeName': value,
      if (instance.loanAmount case final value?) 'loanAmount': value,
      if (instance.noOfInstalments case final value?) 'noOfInstalments': value,
      if (instance.installmentAmount case final value?)
        'installmentAmount': value,
      if (instance.applicationDate case final value?) 'applicationDate': value,
      if (instance.approvalType case final value?) 'approvalType': value,
      if (instance.remarks case final value?) 'remarks': value,
      if (instance.reasonLabel case final value?) 'reasonLabel': value,
      if (instance.maxLoanAmount case final value?) 'maxLoanAmount': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
