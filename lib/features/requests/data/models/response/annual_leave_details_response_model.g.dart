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
      'leaveRequestId': instance.leaveRequestId,
      'requestDate': instance.requestDate,
      'requestType': instance.requestType,
      'leaveStatus': instance.leaveStatus,
      'leaveStatusCode': instance.leaveStatusCode,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'supervisionName': instance.supervisionName,
      'approvalDate': instance.approvalDate,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
