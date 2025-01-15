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
      'userName': instance.userName,
      'applicationDate': instance.applicationDate,
      'reason': instance.reason,
      'reasonRemarks': instance.reasonRemarks,
      'loanAmount': instance.loanAmount,
      'noOfInstalments': instance.noOfInstalments,
    };
