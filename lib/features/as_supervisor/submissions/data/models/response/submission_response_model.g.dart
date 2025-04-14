// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionModel _$SubmissionModelFromJson(Map<String, dynamic> json) =>
    SubmissionModel(
      id: json['id'] as String?,
      empLoginName: json['empLoginName'] as String?,
      createDate: json['createDate'] as String?,
      mobile: json['mobile'] as String?,
      leaveStatus: json['leaveStatus'] as String?,
      leaveType: json['leaveType'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$SubmissionModelToJson(SubmissionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'empLoginName': instance.empLoginName,
      'mobile': instance.mobile,
      'createDate': instance.createDate,
      'leaveType': instance.leaveType,
      'leaveStatus': instance.leaveStatus,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

SubmissionResponseModel _$SubmissionResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubmissionResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubmissionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$SubmissionResponseModelToJson(
        SubmissionResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
