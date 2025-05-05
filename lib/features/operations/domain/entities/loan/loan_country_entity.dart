import 'loan_sector_entity.dart';

class LoanCountryEntity {
  final String? countryName;
  final List<LoanSectorEntity?> loanSectors;

  const LoanCountryEntity({
    required this.countryName,
    required this.loanSectors,
  });
}
