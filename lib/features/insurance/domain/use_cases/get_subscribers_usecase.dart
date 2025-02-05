import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../entities/subscriber_entity.dart';
import '../repositories/insurance_repository.dart';

@injectable
class GetSubscribersUseCase {
  final InsuranceRepository repository;

  GetSubscribersUseCase(this.repository);

  Future<CustomResponseType<BaseEntity<List<SubscriberEntity>>>> call() async {
    return await repository.getSubscribers();
  }
}
