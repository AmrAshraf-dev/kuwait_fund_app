import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_reason_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'personal_loan_reason_response_model.g.dart';

/// Model that transforms the LoanRequest data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class PersonalLoanReasonModel extends PersonalLoanReasonEntity {
  const PersonalLoanReasonModel({
    required super.code,
    required super.reson,
  });

  factory PersonalLoanReasonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalLoanReasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalLoanReasonModelToJson(this);
}

@JsonSerializable()
class PersonalLoanReasonResponseModel
    extends BaseEntity<List<PersonalLoanReasonModel>> {
  const PersonalLoanReasonResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory PersonalLoanReasonResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalLoanReasonResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PersonalLoanReasonResponseModelToJson(this);
}
