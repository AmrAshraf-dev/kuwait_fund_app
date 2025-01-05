import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../entities/contactus_entity.dart";
import "../repositories/contactus_repository.dart";

@injectable
class GetContactusUseCase
    implements UseCaseNoParam<BaseEntity<ContactusEntity>> {
  GetContactusUseCase({required this.contactusRepository});

  final ContactusRepository contactusRepository;

  @override
  Future<CustomResponseType<BaseEntity<ContactusEntity>>> call() {
    return contactusRepository.getContactus();
  }
}
