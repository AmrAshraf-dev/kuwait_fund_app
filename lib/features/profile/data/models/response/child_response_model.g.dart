// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildModel _$ChildModelFromJson(Map<String, dynamic> json) => ChildModel(
      id: json['id'] as String?,
      nameArabic: json['nameArabic'] as String?,
      nameEnglish: json['nameEnglish'] as String?,
      civilID: json['civilID'] as String?,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      childDisabilityDate: json['childDisabilityDate'] as String?,
      childDisabilityType: json['childDisabilityType'] as String?,
      attachmentInfo: json['attachmentInfo'] as String?,
    );

Map<String, dynamic> _$ChildModelToJson(ChildModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.nameEnglish case final value?) 'nameEnglish': value,
      if (instance.nameArabic case final value?) 'nameArabic': value,
      if (instance.civilID case final value?) 'civilID': value,
      if (instance.birthDate case final value?) 'birthDate': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.childDisabilityDate case final value?)
        'childDisabilityDate': value,
      if (instance.childDisabilityType case final value?)
        'childDisabilityType': value,
      if (instance.attachmentInfo case final value?) 'attachmentInfo': value,
    };

ChildResponseModel _$ChildResponseModelFromJson(Map<String, dynamic> json) =>
    ChildResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ChildModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ChildResponseModelToJson(ChildResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
