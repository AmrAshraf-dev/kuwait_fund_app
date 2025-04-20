// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_request_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRequestRequestModel _$LoanRequestRequestModelFromJson(
        Map<String, dynamic> json) =>
    LoanRequestRequestModel(
      userName: json['userName'] as String?,
      applicationDate: json['applicationDate'] as String?,
      reason: json['reason'] as String?,
      reasonRemarks: json['reasonRemarks'] as String?,
      loanAmount: json['loanAmount'] as String?,
      noOfInstalments: json['noOfInstalments'] as String?,
    );

Map<String, dynamic> _$LoanRequestRequestModelToJson(
        LoanRequestRequestModel instance) =>
    <String, dynamic>{
      if (instance.userName case final value?) 'userName': value,
      if (instance.applicationDate case final value?) 'applicationDate': value,
      if (instance.reason case final value?) 'reason': value,
      if (instance.reasonRemarks case final value?) 'reasonRemarks': value,
      if (instance.loanAmount case final value?) 'loanAmount': value,
      if (instance.noOfInstalments case final value?) 'noOfInstalments': value,
    };
