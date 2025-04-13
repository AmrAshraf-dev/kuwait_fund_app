import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_details_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'annual_leave_details_response_model.g.dart';

@JsonSerializable()
class AnnualDetailsModel extends AnnualLeaveDetailsEntity {
  const AnnualDetailsModel({
    required super.leaveRequestId,
    required super.requestDate,
    required super.requestType,
    required super.leaveStatus,
    required super.leaveStatusCode,
    required super.startDate,
    required super.endDate,
    required super.supervisionName,
    required super.approvalDate,
  });

  factory AnnualDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnualDetailsModelToJson(this);
}

@JsonSerializable()
class AnnualDetailsResponseModel extends BaseEntity<List<AnnualDetailsModel>> {
  const AnnualDetailsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AnnualDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnualDetailsResponseModelToJson(this);
}
