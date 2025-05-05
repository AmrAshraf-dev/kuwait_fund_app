import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/spouse_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'spouse_response_model.g.dart';

/// Model that transforms the Spouse data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class SpouseModel extends SpouseEntity {
  const SpouseModel({
    super.id,
    super.nameArabic,
    super.nameEnglish,
    super.civilID,
    super.birthDate,
    super.status,
    super.statusLabel,
    super.statusDate,
    super.attachmentInfo,
  });

  factory SpouseModel.fromJson(Map<String, dynamic> json) =>
      _$SpouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpouseModelToJson(this);
}

@JsonSerializable()
class SpouseResponseModel extends BaseEntity<SpouseModel> {
  const SpouseResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SpouseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpouseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpouseResponseModelToJson(this);
}
