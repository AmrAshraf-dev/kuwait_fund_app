import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/requests_entity.dart';

part 'requests_response_model.g.dart';

/// Model that transforms the Requests data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class RequestsModel extends RequestsEntity {
  const RequestsModel({
    required super.requestID,
    required super.requestTypeID,
    required super.requestDate,
    required super.requestStatus,
    required super.requestTitle,
    required super.details,
  });

  factory RequestsModel.fromJson(Map<String, dynamic> json) =>
      _$RequestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestsModelToJson(this);
}

@JsonSerializable()
class RequestsResponseModel extends BaseEntity<List<RequestsModel>> {
  const RequestsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory RequestsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestsResponseModelToJson(this);
}
