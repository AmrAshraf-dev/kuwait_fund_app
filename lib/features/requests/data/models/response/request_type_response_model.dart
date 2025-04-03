import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/request_type_entity.dart';
 
import '../../../../shared/entity/base_entity.dart';
 
part 'request_type_response_model.g.dart';

/// Model that transforms the RequestType data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class RequestTypeModel extends RequestTypeEntity {
   RequestTypeModel({
    required super.name,
    required super.id,
   
  });

  factory RequestTypeModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTypeModelToJson(this);
}

@JsonSerializable()
class RequestTypeResponseModel extends BaseEntity<List<RequestTypeModel>> {
  const RequestTypeResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory RequestTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTypeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTypeResponseModelToJson(this);
}
