import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/visitor_logs_entity.dart';
 
part 'visitors_management_calendar_model.g.dart';

@JsonSerializable()
class VisitorsManagementCalendarModel extends VisitorsLogsEntity {
  VisitorsManagementCalendarModel({
   required  super.date,
   required super.visitType,
  });
  factory VisitorsManagementCalendarModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsManagementCalendarModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VisitorsManagementCalendarModelToJson(this);
}
