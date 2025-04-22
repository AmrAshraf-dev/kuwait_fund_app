// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      city: json['city'] as String?,
      apartmentNumber: json['apartmentNumber'] as String?,
      building: json['building'] as String?,
      street: json['street'] as String?,
      attachmentInfo: json['attachmentInfo'] as String?,
      avenue: json['avenue'] as String?,
      block: json['block'] as String?,
      phone1: json['phone1'] as String?,
      phone2: json['phone2'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      if (instance.city case final value?) 'city': value,
      if (instance.block case final value?) 'block': value,
      if (instance.street case final value?) 'street': value,
      if (instance.avenue case final value?) 'avenue': value,
      if (instance.building case final value?) 'building': value,
      if (instance.apartmentNumber case final value?) 'apartmentNumber': value,
      if (instance.phone1 case final value?) 'phone1': value,
      if (instance.phone2 case final value?) 'phone2': value,
      if (instance.attachmentInfo case final value?) 'attachmentInfo': value,
    };

AddressResponseModel _$AddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddressResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AddressModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AddressResponseModelToJson(
        AddressResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
