import 'package:json_annotation/json_annotation.dart';
import '../../../../annual_leave_request/domain/entities/emergency_leave_entity.dart';
import '../../../../shared/entity/base_entity.dart';

part 'emergency_leave_request_response_model.g.dart';

@JsonSerializable()
class EmergencyLeaveRequestModel extends EmergencyLeaveEntity {


    EmergencyLeaveRequestModel({
     required super.allowedDays,
     required super.availableDays,
     required super.availableHours,
      required super.availableMinutes,
      required super.canTakeLeaveFlg,
      required super.emergencyLabel,
      required super.emergencyLabelDays,
      required super.emergencyString,
      required super.isEmergencyLeave,
    
  });
 
  factory EmergencyLeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyLeaveRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyLeaveRequestModelToJson(this);
}

@JsonSerializable()
class EmergencyLeaveRequestResponseModel extends BaseEntity<  EmergencyLeaveRequestModel> {
  const EmergencyLeaveRequestResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory EmergencyLeaveRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyLeaveRequestResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyLeaveRequestResponseModelToJson(this);
}
