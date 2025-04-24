// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactus_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactusModel _$ContactusModelFromJson(Map<String, dynamic> json) =>
    ContactusModel(
      telephoneAndFax: json['telephoneAndFax'] == null
          ? null
          : TelephoneAndFaxModel.fromJson(
              json['telephoneAndFax'] as Map<String, dynamic>),
      contactInfo: json['contactInfo'] == null
          ? null
          : ContactInfoModel.fromJson(
              json['contactInfo'] as Map<String, dynamic>),
      mapCoordinates: json['mapCoordinates'] == null
          ? null
          : MapCoordinatesModel.fromJson(
              json['mapCoordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactusModelToJson(ContactusModel instance) =>
    <String, dynamic>{
      if (instance.contactInfo?.toJson() case final value?)
        'contactInfo': value,
      if (instance.mapCoordinates?.toJson() case final value?)
        'mapCoordinates': value,
      if (instance.telephoneAndFax?.toJson() case final value?)
        'telephoneAndFax': value,
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
