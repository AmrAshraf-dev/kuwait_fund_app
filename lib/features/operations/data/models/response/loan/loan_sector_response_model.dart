import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_sector_entity.dart';

part 'loan_sector_response_model.freezed.dart';
part 'loan_sector_response_model.g.dart';

@freezed
class LoanSectorModel with _$LoanSectorModel {
  const LoanSectorModel._();

  const factory LoanSectorModel({
    @JsonKey(name: 'sector_name') required String sectorName,
    @JsonKey(name: 'number') required int number,
    @JsonKey(name: 'amount') required double amount,
  }) = _LoanSectorModel;

  factory LoanSectorModel.fromJson(Map<String, dynamic> json) =>
      _$LoanSectorModelFromJson(json);

  LoanSectorEntity toEntity() {
    return LoanSectorEntity(
      sectorName: sectorName,
      number: number.toString(),
      amount: amount.toString(),
    );
  }
}
