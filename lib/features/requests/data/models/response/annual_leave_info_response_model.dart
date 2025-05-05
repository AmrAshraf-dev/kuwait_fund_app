import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/annual_leave_info_entity.dart';
import '../../../../shared/entity/base_entity.dart';

part 'annual_leave_info_response_model.g.dart';

@JsonSerializable()
class AnnualDetailsInfoModel extends AnnualLeaveInfoEntity {
  const AnnualDetailsInfoModel({
    required super.leaveType,
    required super.leaveStatus,
    required super.leaveStatusCode,
    required super.requestDate,
    required super.leaveStartDate,
    required super.leaveEndDate,
  });

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
