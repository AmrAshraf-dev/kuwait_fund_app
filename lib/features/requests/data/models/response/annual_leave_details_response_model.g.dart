// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_leave_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualDetailsModel _$AnnualDetailsModelFromJson(Map<String, dynamic> json) =>
    AnnualDetailsModel(
      leaveRequestId: json['leaveRequestId'] as String?,
      requestDate: json['requestDate'] as String?,
      requestType: json['requestType'] as String?,
      leaveStatus: json['leaveStatus'] as String?,
      leaveStatusCode: json['leaveStatusCode'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      supervisionName: json['supervisionName'] as String?,
      approvalDate: json['approvalDate'] as String?,
    );

Map<String, dynamic> _$AnnualDetailsModelToJson(AnnualDetailsModel instance) =>
    <String, dynamic>{
      if (instance.leaveRequestId case final value?) 'leaveRequestId': value,
      if (instance.requestDate case final value?) 'requestDate': value,
      if (instance.requestType case final value?) 'requestType': value,
      if (instance.leaveStatus case final value?) 'leaveStatus': value,
      if (instance.leaveStatusCode case final value?) 'leaveStatusCode': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.endDate case final value?) 'endDate': value,
      if (instance.supervisionName case final value?) 'supervisionName': value,
      if (instance.approvalDate case final value?) 'approvalDate': value,
    };

AnnualDetailsResponseModel _$AnnualDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    AnnualDetailsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AnnualDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AnnualDetailsResponseModelToJson(
        AnnualDetailsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
