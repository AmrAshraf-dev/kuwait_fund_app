import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/annual_leave_request_entity.dart';
import '../../../../shared/entity/base_entity.dart';

part 'leave_balance_response_model.g.dart';

@JsonSerializable()
class AnnualLeaveScreenInfoModel extends  AnnualLeaveRequestEntity {


    AnnualLeaveScreenInfoModel({
     required super.availableBalance,
     required super.displayExitDate,
  
  });
 
  factory AnnualLeaveScreenInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualLeaveScreenInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnualLeaveScreenInfoModelToJson(this);
}

@JsonSerializable()
class AnnualLeaveScreenInfoResponseModel extends BaseEntity<  AnnualLeaveScreenInfoModel> {
  const AnnualLeaveScreenInfoResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AnnualLeaveScreenInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualLeaveScreenInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnualLeaveScreenInfoResponseModelToJson(this);
}
