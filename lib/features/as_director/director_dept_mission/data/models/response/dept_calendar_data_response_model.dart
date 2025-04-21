import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_calendar_data_entity.dart';

import '../../../../../shared/entity/base_entity.dart';

part 'dept_calendar_data_response_model.g.dart';

/// Model that transforms the AdminDirectorMission data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class DeptCalendarDataModel extends DirectorDeptCalendarDataEntity {
  DeptCalendarDataModel({
    required super. leave_type,
    required super.     asDate,
 
    
  });

  factory DeptCalendarDataModel.fromJson(Map<String, dynamic> json) =>
      _$DeptCalendarDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeptCalendarDataModelToJson(this);
}

@JsonSerializable()
class DeptCalendarDataResponseModel
    extends BaseEntity<List<DeptCalendarDataModel>> {
  const DeptCalendarDataResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory DeptCalendarDataResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$DeptCalendarDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeptCalendarDataResponseModelToJson(this);
}
