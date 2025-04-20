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
      if (instance.leaveRequestID case final value?) 'leaveRequestID': value,
      if (instance.arabicSupervisorName case final value?)
        'arabicSupervisorName': value,
      if (instance.leaveStatus case final value?) 'leaveStatus': value,
      if (instance.leaveStatusCode case final value?) 'leaveStatusCode': value,
      if (instance.requestDate?.toIso8601String() case final value?)
        'requestDate': value,
      if (instance.leaveType case final value?) 'leaveType': value,
      if (instance.requestStartDate?.toIso8601String() case final value?)
        'requestStartDate': value,
      if (instance.requestEndDate?.toIso8601String() case final value?)
        'requestEndDate': value,
      if (instance.requestExtendDate?.toIso8601String() case final value?)
        'requestExtendDate': value,
      if (instance.leaveBalance case final value?) 'leaveBalance': value,
      if (instance.shortSickDays case final value?) 'shortSickDays': value,
      if (instance.leavDaysTaken case final value?) 'leavDaysTaken': value,
      if (instance.leaveRequestsCount case final value?)
        'leaveRequestsCount': value,
      if (instance.emergencyBalance case final value?)
        'emergencyBalance': value,
      if (instance.availableExceseBalance case final value?)
        'availableExceseBalance': value,
      if (instance.tolalExecese case final value?) 'tolalExecese': value,
      if (instance.lateBalance case final value?) 'lateBalance': value,
      if (instance.emergencyTransffered case final value?)
        'emergencyTransffered': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
