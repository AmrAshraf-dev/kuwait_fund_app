// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      arabicSupervisorName: json['arabicSupervisorName'] as String?,
      availableExceseBalance: json['availableExceseBalance'] as String?,
      emergencyBalance: json['emergencyBalance'] as String?,
      emergencyTransffered: json['emergencyTransffered'] as String?,
      leaveBalance: json['leaveBalance'] as String?,
      leaveRequestsCount: json['leaveRequestsCount'] as String?,
      leaveStatus: json['leaveStatus'] as String?,
      leaveStatusCode: json['leaveStatusCode'] as String?,
      leaveType: json['leaveType'] as String?,
      leaveRequestID: json['leaveRequestID'] as String?,
      leavDaysTaken: json['leavDaysTaken'] as String?,
      lateBalance: json['lateBalance'] as String?,
      requestDate: json['requestDate'] == null
          ? null
          : DateTime.parse(json['requestDate'] as String),
      requestEndDate: json['requestEndDate'] == null
          ? null
          : DateTime.parse(json['requestEndDate'] as String),
      requestExtendDate: json['requestExtendDate'] == null
          ? null
          : DateTime.parse(json['requestExtendDate'] as String),
      requestStartDate: json['requestStartDate'] == null
          ? null
          : DateTime.parse(json['requestStartDate'] as String),
      shortSickDays: json['shortSickDays'] as String?,
      tolalExecese: json['tolalExecese'] as String?,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'leaveRequestID': instance.leaveRequestID,
      'arabicSupervisorName': instance.arabicSupervisorName,
      'leaveStatus': instance.leaveStatus,
      'leaveStatusCode': instance.leaveStatusCode,
      'requestDate': instance.requestDate?.toIso8601String(),
      'leaveType': instance.leaveType,
      'requestStartDate': instance.requestStartDate?.toIso8601String(),
      'requestEndDate': instance.requestEndDate?.toIso8601String(),
      'requestExtendDate': instance.requestExtendDate?.toIso8601String(),
      'leaveBalance': instance.leaveBalance,
      'shortSickDays': instance.shortSickDays,
      'leavDaysTaken': instance.leavDaysTaken,
      'leaveRequestsCount': instance.leaveRequestsCount,
      'emergencyBalance': instance.emergencyBalance,
      'availableExceseBalance': instance.availableExceseBalance,
      'tolalExecese': instance.tolalExecese,
      'lateBalance': instance.lateBalance,
      'emergencyTransffered': instance.emergencyTransffered,
    };

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    HomeResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : HomeModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
