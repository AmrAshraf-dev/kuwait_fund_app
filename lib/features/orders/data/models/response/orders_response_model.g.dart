// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

OrdersResponseModel _$OrdersResponseModelFromJson(Map<String, dynamic> json) =>
    OrdersResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : OrdersModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$OrdersResponseModelToJson(
        OrdersResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
