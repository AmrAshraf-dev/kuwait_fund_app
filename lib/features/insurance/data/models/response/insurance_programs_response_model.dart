import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_programs.dart';

import '../../../../shared/entity/base_entity.dart';

part 'insurance_programs_response_model.g.dart';

/// Model that transforms the Insurance data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class InsuranceProgramsModel extends InsuranceProgramsEntity {
  const InsuranceProgramsModel({
    required super.id,
    required super.name,
  });

  factory InsuranceProgramsModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceProgramsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceProgramsModelToJson(this);
}

@JsonSerializable()
class InsuranceProgramsResponseModel
    extends BaseEntity<List<InsuranceProgramsModel>> {
  const InsuranceProgramsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory InsuranceProgramsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceProgramsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceProgramsResponseModelToJson(this);
}
