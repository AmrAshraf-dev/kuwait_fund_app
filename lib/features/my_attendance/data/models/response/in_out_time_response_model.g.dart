// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_time_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InOutTimeModel _$InOutTimeModelFromJson(Map<String, dynamic> json) =>
    InOutTimeModel(
      inTime: json['inTime'] as String?,
      outTime: json['outTime'] as String?,
    );

Map<String, dynamic> _$InOutTimeModelToJson(InOutTimeModel instance) =>
    <String, dynamic>{
      if (instance.inTime case final value?) 'inTime': value,
      if (instance.outTime case final value?) 'outTime': value,
    };
