import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/delete_leave_entity.dart';
import '../../../../shared/entity/base_entity.dart';

part 'delete_leave_request_response_model.g.dart';

@JsonSerializable()
class DeleteLeaveModel extends CreateDeleteLeaveEntity {
  const DeleteLeaveModel({
    super.leaveRequestId,
  });

  factory DeleteLeaveModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteLeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteLeaveModelToJson(this);
}

@JsonSerializable()
class DeleteLeaveResponseModel extends BaseEntity<DeleteLeaveModel> {
  const DeleteLeaveResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory DeleteLeaveResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteLeaveResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteLeaveResponseModelToJson(this);
}
