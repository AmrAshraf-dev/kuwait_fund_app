import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';

part 'leave_balance_response_model.g.dart';

/// Model that transforms the LeaveBalance data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class LeaveBalanceResponseModel extends BaseEntity<dynamic> {
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
