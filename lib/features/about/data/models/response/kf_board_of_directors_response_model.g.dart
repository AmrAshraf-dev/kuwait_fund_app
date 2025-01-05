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
      'name': instance.name,
      'role': instance.role,
      'imageUrl': instance.imageUrl,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
