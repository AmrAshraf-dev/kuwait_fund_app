// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_sector_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoanSectorModel _$LoanSectorModelFromJson(Map<String, dynamic> json) =>
    _LoanSectorModel(
      sectorName: json['sectorName'] as String? ?? '',
      number: json['number'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$LoanSectorModelToJson(_LoanSectorModel instance) =>
    <String, dynamic>{
      'sectorName': instance.sectorName,
      'number': instance.number,
      'amount': instance.amount,
    };
