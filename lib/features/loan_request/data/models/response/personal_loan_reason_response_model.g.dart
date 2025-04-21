// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_loan_reason_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalLoanReasonModel _$PersonalLoanReasonModelFromJson(
        Map<String, dynamic> json) =>
    PersonalLoanReasonModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PersonalLoanReasonModelToJson(
        PersonalLoanReasonModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };

PersonalLoanReasonResponseModel _$PersonalLoanReasonResponseModelFromJson(
        Map<String, dynamic> json) =>
    PersonalLoanReasonResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              PersonalLoanReasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$PersonalLoanReasonResponseModelToJson(
        PersonalLoanReasonResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
