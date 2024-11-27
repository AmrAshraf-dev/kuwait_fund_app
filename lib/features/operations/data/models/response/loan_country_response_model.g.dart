// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_country_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanCountryModelImpl _$$LoanCountryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoanCountryModelImpl(
      countryName: json['countryName'] as String?,
      loanSectors: (json['loanSectors'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : LoanSectorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LoanCountryModelImplToJson(
        _$LoanCountryModelImpl instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'loanSectors': instance.loanSectors,
    };
