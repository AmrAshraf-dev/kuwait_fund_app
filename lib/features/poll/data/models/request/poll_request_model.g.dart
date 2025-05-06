// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollRequestModel _$PollRequestModelFromJson(Map<String, dynamic> json) =>
    PollRequestModel(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PollRequestModelToJson(PollRequestModel instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      if (instance.pageSize case final value?) 'pageSize': value,
    };
