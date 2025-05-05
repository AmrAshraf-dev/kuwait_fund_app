import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/subscriber_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'insurance_subscriber_response_model.g.dart';

/// Model that transforms the Insurance data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class SubscriberModel extends SubscriberEntity {
  const SubscriberModel({
    required super.name,
    required super.relation,
    required super.dateOfBirth,
  });

  factory SubscriberModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriberModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberModelToJson(this);
}

@JsonSerializable()
class SubscriberResponseModel extends BaseEntity<List<SubscriberModel>> {
  const SubscriberResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SubscriberResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriberResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberResponseModelToJson(this);
}
