import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/more_entity.dart';

part 'more_response_model.g.dart';

/// Model that transforms the More data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class MoreModel extends MoreEntity {
  MoreModel({
    required super.menuTitleAr,
    required super.menuTitleEn,
    required super.iconUrl,
    required super.children,
    required super.navigationKey,
  });

  factory MoreModel.fromJson(Map<String, dynamic> json) =>
      _$MoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoreModelToJson(this);
}

@JsonSerializable()
class MoreResponseModel extends BaseEntity<List<MoreModel>> {
  const MoreResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory MoreResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoreResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoreResponseModelToJson(this);
}
