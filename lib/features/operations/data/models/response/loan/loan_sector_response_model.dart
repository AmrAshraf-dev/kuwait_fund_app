import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/loan/loan_sector_entity.dart';

part 'loan_sector_response_model.freezed.dart';
part 'loan_sector_response_model.g.dart';

@freezed
abstract class LoanSectorModel with _$LoanSectorModel {
  const LoanSectorModel._();

  const factory LoanSectorModel({
    @JsonKey(name: 'sectorName', defaultValue: "") required String sectorName,
    @JsonKey(name: 'number') required String number,
    @JsonKey(name: 'amount') required String amount,
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
