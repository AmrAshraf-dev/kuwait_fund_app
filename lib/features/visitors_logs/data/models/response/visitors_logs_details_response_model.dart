import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_details_entity.dart';
 
import '../../../../shared/entity/base_entity.dart';
 
part 'visitors_logs_details_response_model.g.dart';

/// Model that transforms the VisitorsLogs data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class VisitorsLogsDetailsModel extends VisitorsLogsDetailsEntity {
  VisitorsLogsDetailsModel({
    required super.remarks,
    required super.visitDate,
    required super.visitType,
    required super.visitTime,
    required super.visitorName,
    required super.visitorsCount,
    required super.visitTypeName,
  });

  factory VisitorsLogsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsLogsDetailsModelToJson(this);
}

@JsonSerializable()
class VisitorsLogsDetailsResponseModel extends BaseEntity<List<VisitorsLogsDetailsModel>> {
  const VisitorsLogsDetailsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory VisitorsLogsDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsLogsDetailsResponseModelToJson(this);
}
