// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telephone_and_fax_repsonse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelephoneAndFaxModel _$TelephoneAndFaxModelFromJson(
        Map<String, dynamic> json) =>
    TelephoneAndFaxModel(
      fax: json['fax'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
    );

Map<String, dynamic> _$TelephoneAndFaxModelToJson(
        TelephoneAndFaxModel instance) =>
    <String, dynamic>{
      if (instance.telephoneNumber case final value?) 'telephoneNumber': value,
      if (instance.fax case final value?) 'fax': value,
    };
