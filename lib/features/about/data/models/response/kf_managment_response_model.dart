import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/about/domain/entities/kf_managment_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'kf_managment_response_model.g.dart';

/// Model that transforms the About data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class KFManagmentModel extends KFManagmentEntity {
  const KFManagmentModel({
    required super.imageUrl,
    required super.name,
    required super.role,
  });

  factory KFManagmentModel.fromJson(Map<String, dynamic> json) =>
      _$KFManagmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$KFManagmentModelToJson(this);
}

@JsonSerializable()
class KFManagmentResponseModel extends BaseEntity<List<KFManagmentModel>> {
  const KFManagmentResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory KFManagmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$KFManagmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$KFManagmentResponseModelToJson(this);
}
