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
      if (instance.operationsEmail case final value?) 'operationsEmail': value,
      if (instance.webmasterEmail case final value?) 'webmasterEmail': value,
      if (instance.fax case final value?) 'fax': value,
      if (instance.telephoneNumber case final value?) 'telephoneNumber': value,
      if (instance.address?.toJson() case final value?) 'address': value,
      if (instance.latitude case final value?) 'latitude': value,
      if (instance.longitude case final value?) 'longitude': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
