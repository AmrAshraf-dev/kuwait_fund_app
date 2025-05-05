// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyModel _$FamilyModelFromJson(Map<String, dynamic> json) => FamilyModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      relation: json['relation'] as String?,
    );

Map<String, dynamic> _$FamilyModelToJson(FamilyModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.relation case final value?) 'relation': value,
    };

FamilyResponseModel _$FamilyResponseModelFromJson(Map<String, dynamic> json) =>
    FamilyResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FamilyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$FamilyResponseModelToJson(
        FamilyResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
