import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan_sector_entity.dart';

class LoanCountryEntity {
  final String? countryName;
  final List<LoanSectorEntity?> loanSectors;

  const LoanCountryEntity({
    required this.countryName,
    required this.loanSectors,
  });
}
