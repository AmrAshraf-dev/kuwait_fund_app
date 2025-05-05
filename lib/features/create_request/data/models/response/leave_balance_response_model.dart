import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/leave_balance_entity.dart';
import '../../../../shared/entity/base_entity.dart';

part 'leave_balance_response_model.g.dart';

@JsonSerializable()
class LeaveBalanceModel extends LeaveBalanceEntity {
  const LeaveBalanceModel({required super.data});

  factory LeaveBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveBalanceModelToJson(this);
}

@JsonSerializable()
class LeaveBalanceResponseModel extends BaseEntity {
  const LeaveBalanceResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory LeaveBalanceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveBalanceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveBalanceResponseModelToJson(this);
}
