import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/ads_entity.dart';

part 'ads_response_model.g.dart';

/// Model that transforms the Ads data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class AdsModel extends AdsEntity {
  const AdsModel({
    required super.id,
    required super.templateImageUrl,
    required super.title,
    required super.body,
    required super.createdOn,
    required super.expiresOn,
    required super.externalImage,
    required super.moreLink,
    required super.sortOrder,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsModelToJson(this);
}

@JsonSerializable()
class AdsResponseModel extends BaseEntity<List<AdsModel>> {
  const AdsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AdsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsResponseModelToJson(this);
}
