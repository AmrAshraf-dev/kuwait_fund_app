import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_country_entity.dart';

class LoanEntity {
  final String divisionName;
  final List<LoanCountryEntity> loanCountries;

  const LoanEntity({
    required this.divisionName,
    required this.loanCountries,
  });
}
