// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_country_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoanCountryModel _$LoanCountryModelFromJson(Map<String, dynamic> json) =>
    _LoanCountryModel(
      countryName: json['countryName'] as String?,
      loanSectors: (json['loanSectors'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : LoanSectorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoanCountryModelToJson(_LoanCountryModel instance) =>
    <String, dynamic>{
      if (instance.countryName case final value?) 'countryName': value,
      'loanSectors': instance.loanSectors.map((e) => e?.toJson()).toList(),
    };
