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
      if (instance.foundationName case final value?) 'foundationName': value,
      if (instance.paidUpAmount case final value?) 'paidUpAmount': value,
      if (instance.committedAmount case final value?) 'committedAmount': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
