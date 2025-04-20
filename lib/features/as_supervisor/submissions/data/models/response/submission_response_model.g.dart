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
      if (instance.id case final value?) 'id': value,
      if (instance.empLoginName case final value?) 'empLoginName': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.createDate case final value?) 'createDate': value,
      if (instance.leaveType case final value?) 'leaveType': value,
      if (instance.leaveStatus case final value?) 'leaveStatus': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.endDate case final value?) 'endDate': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
