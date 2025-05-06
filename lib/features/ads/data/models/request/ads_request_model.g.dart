// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsRequestModel _$AdsRequestModelFromJson(Map<String, dynamic> json) =>
    AdsRequestModel(
      pageNumber: json['pageNumber'] as String?,
      pageSize: json['pageSize'] as String?,
    );

Map<String, dynamic> _$AdsRequestModelToJson(AdsRequestModel instance) =>
    <String, dynamic>{
      if (instance.pageNumber case final value?) 'pageNumber': value,
      if (instance.pageSize case final value?) 'pageSize': value,
    };
