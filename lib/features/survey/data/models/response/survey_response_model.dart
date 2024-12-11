import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/survey_entity.dart';

part 'survey_response_model.g.dart';

/// Model that transforms the Survey data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class SurveyModel extends SurveyEntity {
  SurveyModel({
    required super.var1,
    required super.var2,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyModelToJson(this);
}

@JsonSerializable()
class SurveyResponseModel extends BaseEntity<SurveyModel> {
  const SurveyResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyResponseModelToJson(this);
}
