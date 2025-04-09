import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';

import '../../../../shared/entity/base_entity.dart';
 
part 'visitors_logs_hosts_response_model.g.dart';

/// Model that transforms the VisitorsLogs data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class VisitorsLogsHostsModel extends VisitorsLogsHostsEntity {
  VisitorsLogsHostsModel({
    required super.id,
    required super.name,
  });

  factory VisitorsLogsHostsModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsHostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsLogsHostsModelToJson(this);
}

@JsonSerializable()
class VisitorsLogsHostsResponseModel extends BaseEntity<List<VisitorsLogsHostsModel>> {
  const VisitorsLogsHostsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory VisitorsLogsHostsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsLogsHostsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsLogsHostsResponseModelToJson(this);
}
