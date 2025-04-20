// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_leave_details_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualLeaveDetailsRequestModel _$AnnualLeaveDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    AnnualLeaveDetailsRequestModel(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$AnnualLeaveDetailsRequestModelToJson(
        AnnualLeaveDetailsRequestModel instance) =>
    <String, dynamic>{
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.endDate case final value?) 'endDate': value,
    };
