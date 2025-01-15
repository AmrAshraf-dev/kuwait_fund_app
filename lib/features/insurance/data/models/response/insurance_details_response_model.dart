import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/insurance_entity.dart';

part 'insurance_details_response_model.g.dart';

/// Model that transforms the Insurance data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class InsuranceDetailsModel extends InsuranceEntity {
  const InsuranceDetailsModel({
    required super.id,
    required super.programName,
    required super.employeeName,
    required super.insuranceCompanyName,
    required super.insuranceCompany,
    required super.statusLabel,
    required super.noOfPersons,
    required super.startDate,
    required super.deleteNotes,
    required super.programSubscribed,
    required super.viewButtons,
    required super.beneficiaries,
  });

  factory InsuranceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceDetailsModelToJson(this);
}

@JsonSerializable()
class InsuranceDetailsResponseModel extends BaseEntity<InsuranceDetailsModel> {
  const InsuranceDetailsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory InsuranceDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceDetailsResponseModelToJson(this);
}
