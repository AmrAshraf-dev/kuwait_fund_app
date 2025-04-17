// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_sector_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanSectorModelImpl _$$LoanSectorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoanSectorModelImpl(
      sectorName: json['sector_name'] as String,
      number: (json['number'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$LoanSectorModelImplToJson(
        _$LoanSectorModelImpl instance) =>
    <String, dynamic>{
      'sector_name': instance.sectorName,
      'number': instance.number,
      'amount': instance.amount,
    };
