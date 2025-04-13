import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_info_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'annual_leave_info_response_model.g.dart';

@JsonSerializable()
class AnnualDetailsInfoModel extends AnnualLeaveInfoEntity {
  const AnnualDetailsInfoModel(
      {required super.leaveRequestId,
      required super.arabicSupervisorName,
      required super.englishSupervisorName,
      required super.englishLeaveStatus,
      required super.arabicLeaveStatus,
      required super.leaveStatusCode,
      required super.requestDate,
      required super.leaveTypeArabic,
      required super.leaveTypeEnglish,
      required super.requestStartDate,
      required super.requestEndDate,
      required super.leaveId,
      required super.leaveStartDate,
      required super.leaveEndDate,
      required super.requestExtendDate,
      required super.extended_flg,
      required super.showExtendButton,
      required super.showCancelButton,
      required super.leaveBalance,
      required super.shortSickDays,
      required super.leavDaysTaken,
      required super.leaveRequestsCount,
      required super.emergencyBalance,
      required super.availableExceseBalance,
      required super.tolalExecese,
      required super.lateBalance,
      required super.emergencyTransffered,
      required super.requestTypeEnglish,
      required super.requestTypeArabic});

  factory AnnualDetailsInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualDetailsInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnualDetailsInfoModelToJson(this);
}

@JsonSerializable()
class AnnualDetailsInfoResponseModel
    extends BaseEntity<AnnualDetailsInfoModel> {
  const AnnualDetailsInfoResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AnnualDetailsInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualDetailsInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnualDetailsInfoResponseModelToJson(this);
}
