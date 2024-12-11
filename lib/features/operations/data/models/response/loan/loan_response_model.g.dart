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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
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
      'loanCountries': instance.loanCountries,
    };
