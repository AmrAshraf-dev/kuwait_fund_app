// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kf_board_of_directors_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KFBoardOfDirectorsModel _$KFBoardOfDirectorsModelFromJson(
        Map<String, dynamic> json) =>
    KFBoardOfDirectorsModel(
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$KFBoardOfDirectorsModelToJson(
        KFBoardOfDirectorsModel instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.role case final value?) 'role': value,
      if (instance.imageUrl case final value?) 'imageUrl': value,
    };

KFBoardOfDirectorsResponseModel _$KFBoardOfDirectorsResponseModelFromJson(
        Map<String, dynamic> json) =>
    KFBoardOfDirectorsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              KFBoardOfDirectorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$KFBoardOfDirectorsResponseModelToJson(
        KFBoardOfDirectorsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
