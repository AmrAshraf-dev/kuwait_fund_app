import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kf_ess_mobile_app/features/operations/data/models/response/loan/loan_sector_response_model.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_country_entity.dart';

part 'loan_country_response_model.freezed.dart';
part 'loan_country_response_model.g.dart';

/// Model that transforms the Loan data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@freezed
abstract class LoanCountryModel with _$LoanCountryModel {
  const LoanCountryModel._();

  const factory LoanCountryModel({
    required String? countryName,
    required List<LoanSectorModel?> loanSectors,
  }) = _LoanCountryModel;

  factory LoanCountryModel.fromJson(Map<String, dynamic> json) =>
      _$LoanCountryModelFromJson(json);

  LoanCountryEntity toEntity() {
    return LoanCountryEntity(
      countryName: countryName,
      loanSectors: loanSectors.map((e) => e!.toEntity()).toList(),
    );
  }
  

}
