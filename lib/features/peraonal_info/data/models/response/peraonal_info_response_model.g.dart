// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peraonal_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeraonalInfoModel _$PeraonalInfoModelFromJson(Map<String, dynamic> json) =>
    PeraonalInfoModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$PeraonalInfoModelToJson(PeraonalInfoModel instance) =>
    <String, dynamic>{
      if (instance.var1 case final value?) 'var1': value,
      if (instance.var2 case final value?) 'var2': value,
    };

PeraonalInfoResponseModel _$PeraonalInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    PeraonalInfoResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PeraonalInfoModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$PeraonalInfoResponseModelToJson(
        PeraonalInfoResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
