import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/general_information_entity.dart';

part 'general_information_response_model.g.dart';

/// Model that transforms the About data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class GeneralInformationModel extends GeneralInformationEntity {
  const GeneralInformationModel({
    required super.title,
    required super.description,
  });

  factory GeneralInformationModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralInformationModelToJson(this);
}

@JsonSerializable()
class GeneralInformationResponseModel
    extends BaseEntity<List<GeneralInformationModel>> {
  const GeneralInformationResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory GeneralInformationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralInformationResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GeneralInformationResponseModelToJson(this);
}
