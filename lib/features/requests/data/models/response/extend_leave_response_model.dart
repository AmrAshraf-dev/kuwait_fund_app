import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/extend_leave_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'extend_leave_response_model.g.dart';

@JsonSerializable()
class ExtendLeaveModel extends CreateExtendLeaveEntity {
  const ExtendLeaveModel({
    super.leaveRequestId,
    super.extendDate,
  });

  factory ExtendLeaveModel.fromJson(Map<String, dynamic> json) =>
      _$ExtendLeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendLeaveModelToJson(this);
}

@JsonSerializable()
class ExtendLeaveResponseModel extends BaseEntity<ExtendLeaveModel> {
  const ExtendLeaveResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory ExtendLeaveResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExtendLeaveResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendLeaveResponseModelToJson(this);
}
