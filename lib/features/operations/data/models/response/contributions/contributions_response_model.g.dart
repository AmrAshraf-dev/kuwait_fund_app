// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contributions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContributionModel _$ContributionModelFromJson(Map<String, dynamic> json) =>
    ContributionModel(
      committedAmount: json['committedAmount'] as String?,
      foundationName: json['foundationName'] as String?,
      paidUpAmount: json['paidUpAmount'] as String?,
    );

Map<String, dynamic> _$ContributionModelToJson(ContributionModel instance) =>
    <String, dynamic>{
      'foundationName': instance.foundationName,
      'paidUpAmount': instance.paidUpAmount,
      'committedAmount': instance.committedAmount,
    };

ContributionsResponseModel _$ContributionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContributionsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ContributionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ContributionsResponseModelToJson(
        ContributionsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
