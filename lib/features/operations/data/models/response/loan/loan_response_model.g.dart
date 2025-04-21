// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanResponseModel _$LoanResponseModelFromJson(Map<String, dynamic> json) =>
    LoanResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LoanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$LoanResponseModelToJson(LoanResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

_$LoanModelImpl _$$LoanModelImplFromJson(Map<String, dynamic> json) =>
    _$LoanModelImpl(
      divisionName: json['divisionName'] as String,
      loanCountries: (json['loanCountries'] as List<dynamic>)
          .map((e) => LoanCountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LoanModelImplToJson(_$LoanModelImpl instance) =>
    <String, dynamic>{
      'divisionName': instance.divisionName,
      'loanCountries': instance.loanCountries.map((e) => e.toJson()).toList(),
    };
