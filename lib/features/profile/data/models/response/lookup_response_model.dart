import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/look_up_entity.dart';

part 'lookup_response_model.g.dart';

/// Model that transforms the Profile data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class LookupModel extends LookUpEntity {
   LookupModel({
    super.name,
    super.id,

  });

  factory LookupModel.fromJson(Map<String, dynamic> json) =>
      _$LookupModelFromJson(json);

  Map<String, dynamic> toJson() => _$LookupModelToJson(this);
}


@JsonSerializable()
class LookupResponseModel extends BaseEntity<List<LookupModel>> {
  const LookupResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory LookupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LookupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LookupResponseModelToJson(this);
}
