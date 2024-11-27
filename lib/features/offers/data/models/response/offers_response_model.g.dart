// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersModel _$OffersModelFromJson(Map<String, dynamic> json) => OffersModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$OffersModelToJson(OffersModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

OffersResponseModel _$OffersResponseModelFromJson(Map<String, dynamic> json) =>
    OffersResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : OffersModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$OffersResponseModelToJson(
        OffersResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
