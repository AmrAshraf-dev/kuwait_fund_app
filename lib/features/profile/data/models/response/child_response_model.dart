import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/Child_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'child_response_model.g.dart';

/// Model that transforms the Child data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class ChildModel extends ChildEntity {
  const ChildModel({
    super.id,
    super.name,
    super.civilID,
    super.birthDate,
    super.gender,
    super.childDisabilityDate,
    super.childDisabilityType,
    super.attachmentInfo,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildModelToJson(this);
}

@JsonSerializable()
class ChildResponseModel extends BaseEntity<ChildModel> {
  const ChildResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory ChildResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChildResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildResponseModelToJson(this);
}
