import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/insurance_entity.dart';

part 'insurance_response_model.g.dart';

/// Model that transforms the Insurance data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class InsuranceModel extends InsuranceEntity {
  const InsuranceModel({
    required super.employeeName,
    required super.insuranceCompanyName,
    required super.noOfPersons,
    required super.startDate,
    required super.programSubscribed,
    required super.beneficiaries,
    super.insuranceCompanyID,
    super.insurenceStatus,
    super.isMedicallySubscribed,
    super.hasMedicalRequest,
    super.viewCancelButton,
    super.isAllowedTosubscribe,
  });

  factory InsuranceModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceModelToJson(this);
}

@JsonSerializable()
class InsuranceResponseModel extends BaseEntity<InsuranceModel> {
  const InsuranceResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory InsuranceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceResponseModelToJson(this);
}
