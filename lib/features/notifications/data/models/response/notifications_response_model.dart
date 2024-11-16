
import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/core/enums/request_type_enum.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/notifications_entity.dart';

part 'notifications_response_model.g.dart';



/// Model that transforms the Notifications data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class NotificationsModel extends NotificationsEntity {
  const NotificationsModel(
      {
      required super.date,
      required super.title,
      required super.description,
      required super.type,
      });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsModelToJson(this);
}

@JsonSerializable()
class NotificationsResponseModel extends BaseEntity<NotificationsModel> {
  const NotificationsResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory NotificationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseModelToJson(this);
}