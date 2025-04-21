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
      'city': instance.city,
      'block': instance.block,
      'street': instance.street,
      'avenue': instance.avenue,
      'building': instance.building,
      'apartmentNumber': instance.apartmentNumber,
      'phone1': instance.phone1,
      'phone2': instance.phone2,
      'attachmentInfo': instance.attachmentInfo,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
