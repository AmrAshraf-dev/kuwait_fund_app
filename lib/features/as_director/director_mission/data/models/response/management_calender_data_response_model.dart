import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_mission/domain/entities/director_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_mission/domain/entities/management_calender_data_entity.dart';

import '../../../../../shared/entity/base_entity.dart';
 
part 'management_calender_data_response_model.g.dart';

/// Model that transforms the AdminHome data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class ManagementCalenderDataModel extends ManagementCalenderDataEntity {
  ManagementCalenderDataModel({
    required super.asDate,
    required super.leave_type,
  });

  factory ManagementCalenderDataModel.fromJson(Map<String, dynamic> json) =>
      _$ManagementCalenderDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementCalenderDataModelToJson(this);
}

@JsonSerializable()
class ManagementCalenderDataResponseModel extends BaseEntity<List<ManagementCalenderDataModel>> {
  const ManagementCalenderDataResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory ManagementCalenderDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ManagementCalenderDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementCalenderDataResponseModelToJson(this);
}
