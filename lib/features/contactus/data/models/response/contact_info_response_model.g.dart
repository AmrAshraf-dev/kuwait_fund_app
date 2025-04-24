// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfoModel _$ContactInfoModelFromJson(Map<String, dynamic> json) =>
    ContactInfoModel(
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationsEmail: json['operationsEmail'] as String?,
      webmasterEmail: json['webmasterEmail'] as String?,
    );

Map<String, dynamic> _$ContactInfoModelToJson(ContactInfoModel instance) =>
    <String, dynamic>{
      if (instance.operationsEmail case final value?) 'operationsEmail': value,
      if (instance.webmasterEmail case final value?) 'webmasterEmail': value,
      if (instance.address?.map((e) => e.toJson()).toList() case final value?)
        'address': value,
    };
