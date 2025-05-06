// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollModel _$PollModelFromJson(Map<String, dynamic> json) => PollModel(
      id: (json['id'] as num?)?.toInt(),
      createdOn: json['createdOn'] as String?,
      expiresOn: json['expiresOn'] as String?,
      question: json['question'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PollModelToJson(PollModel instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.question case final value?) 'question': value,
      if (instance.expiresOn case final value?) 'expiresOn': value,
      if (instance.createdOn case final value?) 'createdOn': value,
      if (instance.sortOrder case final value?) 'sortOrder': value,
    };

PollResponseModel _$PollResponseModelFromJson(Map<String, dynamic> json) =>
    PollResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PollModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$PollResponseModelToJson(PollResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
