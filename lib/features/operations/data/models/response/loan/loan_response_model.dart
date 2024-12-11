import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kf_ess_mobile_app/features/operations/data/models/response/loan/loan_country_response_model.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_entity.dart';

import '../../../../../shared/entity/base_entity.dart';

part 'loan_response_model.freezed.dart';
part 'loan_response_model.g.dart';

/// Model that transforms the Loan data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@freezed
class LoanModel with _$LoanModel {
  const LoanModel._();
  const factory LoanModel({
    required String divisionName,
    required List<LoanCountryModel> loanCountries,
  }) = _LoanModel;

  factory LoanModel.fromJson(Map<String, dynamic> json) =>
      _$LoanModelFromJson(json);

  LoanEntity toEntity() {
    return LoanEntity(
      divisionName: divisionName,
      loanCountries: loanCountries.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class LoanResponseModel extends BaseEntity<List<LoanModel>> {
  const LoanResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory LoanResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoanResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoanResponseModelToJson(this);

  toEntity() {
    return BaseEntity<List<LoanEntity>>(
      data: data!.map((e) => e.toEntity()).toList(),
      message: message,
      code: code,
      totalRecords: totalRecords,
      hasMorePages: hasMorePages,
    );
  }
}
