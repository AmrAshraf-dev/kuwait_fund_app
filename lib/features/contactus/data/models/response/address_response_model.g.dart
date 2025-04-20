// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      line3: json['line3'] as String?,
      line4: json['line4'] as String?,
      line5: json['line5'] as String?,
      line6: json['line6'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      if (instance.line1 case final value?) 'line1': value,
      if (instance.line2 case final value?) 'line2': value,
      if (instance.line3 case final value?) 'line3': value,
      if (instance.line4 case final value?) 'line4': value,
      if (instance.line5 case final value?) 'line5': value,
      if (instance.line6 case final value?) 'line6': value,
    };
