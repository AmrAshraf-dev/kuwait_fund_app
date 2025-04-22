import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/Family_entity.dart';

part 'family_response_model.g.dart';

/// Model that transforms the Family data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class FamilyModel extends FamilyEntity {
  const FamilyModel({
    super.id,
    super.name,
    super.relation,
  });

  factory FamilyModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyModelFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyModelToJson(this);
}

@JsonSerializable()
class FamilyResponseModel extends BaseEntity<List<FamilyModel>> {
  const FamilyResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory FamilyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyResponseModelToJson(this);
}
