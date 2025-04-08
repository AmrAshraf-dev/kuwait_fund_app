import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/visitors_logs_entity.dart';

part 'visitors_logs_response_model.g.dart';

/// Model that transforms the VisitorsLogs data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class VisitorsLogsModel extends VisitorsLogsEntity {
  VisitorsLogsModel({
    required super.date,
    required super.visitType,
  });

  factory VisitorsLogsModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsLogsModelToJson(this);
}

@JsonSerializable()
class VisitorsLogsResponseModel extends BaseEntity<List<VisitorsLogsModel>> {
  const VisitorsLogsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory VisitorsLogsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsLogsResponseModelToJson(this);
}
