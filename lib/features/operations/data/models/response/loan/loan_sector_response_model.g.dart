// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_sector_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanSectorModelImpl _$$LoanSectorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoanSectorModelImpl(
      sectorName: json['sectorName'] as String? ?? '',
      number: json['number'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$$LoanSectorModelImplToJson(
        _$LoanSectorModelImpl instance) =>
    <String, dynamic>{
      'sectorName': instance.sectorName,
      'number': instance.number,
      'amount': instance.amount,
    };
