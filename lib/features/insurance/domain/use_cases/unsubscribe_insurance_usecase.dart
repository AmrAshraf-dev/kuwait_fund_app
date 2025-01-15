import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../repositories/insurance_repository.dart';

@injectable
class UnsubscribeInsuranceUseCase {
  final InsuranceRepository repository;

  UnsubscribeInsuranceUseCase(this.repository);

  Future<CustomResponseType<BaseEntity<void>>> call() async {
    return await repository.unsubscribeInsurance();
  }
}
