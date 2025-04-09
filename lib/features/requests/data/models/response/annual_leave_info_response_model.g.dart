// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_leave_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualDetailsInfoModel _$AnnualDetailsInfoModelFromJson(
        Map<String, dynamic> json) =>
    AnnualDetailsInfoModel(
      leaveRequestId: json['leaveRequestId'] as String?,
      arabicSupervisorName: json['arabicSupervisorName'] as String?,
      englishSupervisorName: json['englishSupervisorName'] as String?,
      englishLeaveStatus: json['englishLeaveStatus'] as String?,
      arabicLeaveStatus: json['arabicLeaveStatus'] as String?,
      leaveStatusCode: json['leaveStatusCode'] as String?,
      requestDate: json['requestDate'] as String?,
      leaveTypeArabic: json['leaveTypeArabic'] as String?,
      leaveTypeEnglish: json['leaveTypeEnglish'] as String?,
      requestStartDate: json['requestStartDate'] as String?,
      requestEndDate: json['requestEndDate'] as String?,
      leaveId: json['leaveId'] as String?,
      leaveStartDate: json['leaveStartDate'] as String?,
      leaveEndDate: json['leaveEndDate'] as String?,
      requestExtendDate: json['requestExtendDate'] as String?,
      extended_flg: json['extended_flg'] as String?,
      showExtendButton: json['showExtendButton'] as String?,
      showCancelButton: json['showCancelButton'] as String?,
      leaveBalance: json['leaveBalance'] as String?,
      shortSickDays: json['shortSickDays'] as String?,
      leavDaysTaken: json['leavDaysTaken'] as String?,
      leaveRequestsCount: json['leaveRequestsCount'] as String?,
      emergencyBalance: json['emergencyBalance'] as String?,
      availableExceseBalance: json['availableExceseBalance'] as String?,
      tolalExecese: json['tolalExecese'] as String?,
      lateBalance: json['lateBalance'] as String?,
      emergencyTransffered: json['emergencyTransffered'] as String?,
      requestTypeEnglish: json['requestTypeEnglish'] as String?,
      requestTypeArabic: json['requestTypeArabic'] as String?,
    );

Map<String, dynamic> _$AnnualDetailsInfoModelToJson(
        AnnualDetailsInfoModel instance) =>
    <String, dynamic>{
      'leaveRequestId': instance.leaveRequestId,
      'arabicSupervisorName': instance.arabicSupervisorName,
      'englishSupervisorName': instance.englishSupervisorName,
      'englishLeaveStatus': instance.englishLeaveStatus,
      'arabicLeaveStatus': instance.arabicLeaveStatus,
      'leaveStatusCode': instance.leaveStatusCode,
      'requestDate': instance.requestDate,
      'leaveTypeArabic': instance.leaveTypeArabic,
      'leaveTypeEnglish': instance.leaveTypeEnglish,
      'requestStartDate': instance.requestStartDate,
      'requestEndDate': instance.requestEndDate,
      'leaveId': instance.leaveId,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
      'requestExtendDate': instance.requestExtendDate,
      'extended_flg': instance.extended_flg,
      'showExtendButton': instance.showExtendButton,
      'showCancelButton': instance.showCancelButton,
      'leaveBalance': instance.leaveBalance,
      'shortSickDays': instance.shortSickDays,
      'leavDaysTaken': instance.leavDaysTaken,
      'leaveRequestsCount': instance.leaveRequestsCount,
      'emergencyBalance': instance.emergencyBalance,
      'availableExceseBalance': instance.availableExceseBalance,
      'tolalExecese': instance.tolalExecese,
      'lateBalance': instance.lateBalance,
      'emergencyTransffered': instance.emergencyTransffered,
      'requestTypeEnglish': instance.requestTypeEnglish,
      'requestTypeArabic': instance.requestTypeArabic,
    };

AnnualDetailsInfoResponseModel _$AnnualDetailsInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    AnnualDetailsInfoResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AnnualDetailsInfoModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AnnualDetailsInfoResponseModelToJson(
        AnnualDetailsInfoResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
