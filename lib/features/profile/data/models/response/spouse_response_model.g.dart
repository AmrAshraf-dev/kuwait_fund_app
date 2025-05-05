// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spouse_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpouseModel _$SpouseModelFromJson(Map<String, dynamic> json) => SpouseModel(
      id: json['id'] as String?,
      nameArabic: json['nameArabic'] as String?,
      nameEnglish: json['nameEnglish'] as String?,
      civilID: json['civilID'] as String?,
      birthDate: json['birthDate'] as String?,
      status: json['status'] as String?,
      statusLabel: json['statusLabel'] as String?,
      statusDate: json['statusDate'] as String?,
      attachmentInfo: json['attachmentInfo'] as String?,
    );

Map<String, dynamic> _$SpouseModelToJson(SpouseModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.nameArabic case final value?) 'nameArabic': value,
      if (instance.nameEnglish case final value?) 'nameEnglish': value,
      if (instance.civilID case final value?) 'civilID': value,
      if (instance.birthDate case final value?) 'birthDate': value,
      if (instance.status case final value?) 'status': value,
      if (instance.statusLabel case final value?) 'statusLabel': value,
      if (instance.statusDate case final value?) 'statusDate': value,
      if (instance.attachmentInfo case final value?) 'attachmentInfo': value,
    };

SpouseResponseModel _$SpouseResponseModelFromJson(Map<String, dynamic> json) =>
    SpouseResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : SpouseModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$SpouseResponseModelToJson(
        SpouseResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
