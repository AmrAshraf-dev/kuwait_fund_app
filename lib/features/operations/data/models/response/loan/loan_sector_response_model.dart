import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_sector_entity.dart';

part 'loan_sector_response_model.freezed.dart';
part 'loan_sector_response_model.g.dart';

/// Model that transforms the Loan data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@freezed
class LoanSectorModel with _$LoanSectorModel {
  const LoanSectorModel._();

  const factory LoanSectorModel({
    required String sectorName,
    required String number,
    required String amount,
  }) = _LoanSectorModel;

  factory LoanSectorModel.fromJson(Map<String, dynamic> json) =>
      _$LoanSectorModelFromJson(json);

  LoanSectorEntity toEntity() {
    return LoanSectorEntity(
      sectorName: sectorName,
      number: number,
      amount: amount,
    );
  }
}
