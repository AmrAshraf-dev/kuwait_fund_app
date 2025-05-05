// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreModel _$MoreModelFromJson(Map<String, dynamic> json) => MoreModel(
      menuTitleAr: json['menuTitleAr'] as String?,
      menuTitleEn: json['menuTitleEn'] as String?,
      iconUrl: json['iconUrl'] as String?,
      children:
          (json['children'] as List<dynamic>).map((e) => e as String).toList(),
      navigationKey: json['navigationKey'] as String?,
    );

Map<String, dynamic> _$MoreModelToJson(MoreModel instance) => <String, dynamic>{
      if (instance.menuTitleEn case final value?) 'menuTitleEn': value,
      if (instance.menuTitleAr case final value?) 'menuTitleAr': value,
      if (instance.iconUrl case final value?) 'iconUrl': value,
      if (instance.navigationKey case final value?) 'navigationKey': value,
      'children': instance.children,
    };

MoreResponseModel _$MoreResponseModelFromJson(Map<String, dynamic> json) =>
    MoreResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$MoreResponseModelToJson(MoreResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
