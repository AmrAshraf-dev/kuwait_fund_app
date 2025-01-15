// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_loan_reason_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalLoanReasonModel _$PersonalLoanReasonModelFromJson(
        Map<String, dynamic> json) =>
    PersonalLoanReasonModel(
      code: json['code'] as String?,
      reson: json['reson'] as String?,
    );

Map<String, dynamic> _$PersonalLoanReasonModelToJson(
        PersonalLoanReasonModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'reson': instance.reson,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
