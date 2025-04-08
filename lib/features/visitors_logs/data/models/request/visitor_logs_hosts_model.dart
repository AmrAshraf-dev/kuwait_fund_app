import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitors_logs_entity.dart';

part 'visitor_logs_hosts_model.g.dart';

@JsonSerializable()
class VisitorLogsHostsModel extends VisitorLogsHostsEntity {
  VisitorLogsHostsModel({
    super.name,
  });
  factory VisitorLogsHostsModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorLogsHostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorLogsHostsModelToJson(this);
}
