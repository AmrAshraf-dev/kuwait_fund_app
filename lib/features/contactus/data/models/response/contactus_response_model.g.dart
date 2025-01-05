// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactus_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactusModel _$ContactusModelFromJson(Map<String, dynamic> json) =>
    ContactusModel(
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      fax: json['fax'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      operationsEmail: json['operationsEmail'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
      webmasterEmail: json['webmasterEmail'] as String?,
    );

Map<String, dynamic> _$ContactusModelToJson(ContactusModel instance) =>
    <String, dynamic>{
      'operationsEmail': instance.operationsEmail,
      'webmasterEmail': instance.webmasterEmail,
      'fax': instance.fax,
      'telephoneNumber': instance.telephoneNumber,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

ContactusResponseModel _$ContactusResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactusResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ContactusModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ContactusResponseModelToJson(
        ContactusResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
